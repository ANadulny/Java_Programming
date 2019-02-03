from collections import namedtuple
from jinja2 import Template

Trigger = namedtuple('Trigger', 'table, column')

trigger_template = Template("""
{% for table in tables %}
{% for exec in execution | default(default_execution) %}
{% set trigger_name -%}
{{ type }}_{{ table.table }}_{{ exec | lower | replace(' ', '_') }}
{%- endset -%}
DROP TRIGGER IF EXISTS {{ trigger_name }};
DELIMITER $$
CREATE DEFINER = CURRENT_USER
TRIGGER {{ trigger_name }}
{{ exec }} ON {{ table.table }}
FOR EACH ROW
BEGIN
{% for column in table.columns -%}
  CALL help_{{ type }}({%if table.use_old | default(false) %}OLD.{{ column }}, {% endif %}NEW.{{ column }});
{% endfor -%}
END $$
DELIMITER ;

{% endfor %}

{% endfor %}
""")


triggers = [
    {
        'type': 'verify_positive',
        'tables': [
            {
                'table': 'Cennik',
                'columns': [
                    'PLN_za_km',
                    'PLN_za_minute',
                    'PLN_za_godzine',
                    'PLN_za_dobe',
                    'PLN_za_postoj',
                ],
            },
            {
                'table': 'Przeglad',
                'columns': [
                    'Koszt',
                ],
            },
            {
                'table': 'Transakcja',
                'columns': [
                    'Kwota',
                    'KosztaDodatkowe',
                ],
            },
            {
                'table': 'ModelSamochodu',
                'columns': [
                    'Spalanie',
                ],
            },
            {
                'table': 'Samochod',
                'columns': [
                    'Przebieg',
                ],
            },
        ],
    },
    {
        'type': 'verify_date',
        'tables': [
            {
                'table': 'Wypozyczenie',
                'columns': [
                    'DataWypozyczenia',
                ],
            },
            {
                'table': 'Przeglad',
                'columns': [
                    'DataPrzegladu',
                ],
            },
        ],
    },
    {
        'type': 'verify_age',
        'tables': [
            {
                'table': 'Uzytkownik',
                'columns': [
                    'Pesel',
                ],
            },
        ],
    },
    {
        'type': 'verify_occupied',
        'execution': ['BEFORE UPDATE'],
        'tables': [
            {
                'table': 'Samochod',
                'use_old': True,
                'columns': [
                    'Dostepnosc',
                ],
            },
        ],
    },
    {
        'type': 'verify_can_rent',
        'execution': ['BEFORE INSERT'],
        'tables': [
            {
                'table': 'Wypozyczenie',
                'columns': [
                    'Konto_ID',
                ],
            },
        ],
    },
]


gen_triggers = (trigger_template.render(t, default_execution=['BEFORE INSERT', 'BEFORE UPDATE']) for t in triggers)

print('\n\n'.join(gen_triggers))
