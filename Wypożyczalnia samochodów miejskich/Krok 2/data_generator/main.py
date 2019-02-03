from collections import namedtuple
import faker
from pesel import pesel
import random
from string import ascii_uppercase, digits
from itertools import chain
import json
import datetime

class FakeDataGenerator:
    FUN = namedtuple('FUN', 'name, data')

    UZYTKOWNIK = namedtuple('UZYTKOWNIK', 'Uzytkownik_ID, Imie, Nazwisko, Pesel, NrTelefonu')
    KONTO = namedtuple('KONTO', 'Konto_ID, Uzytkownik_ID, Srodki, Login, Haslo, AdresEmail')
    PAKIET_OCHRONNY = namedtuple('PAKIET_OCHRONNY', 'PakietOchronny_ID, Konto_ID, DataWaznosci')
    WARSZTAT = namedtuple('WARSZTAT', 'Warsztat_ID, Nazwa, KodPocztowy, Adres')
    CENNIK = namedtuple('CENNIK', 'Cena_ID, PLN_za_km, PLN_za_minute, PLN_za_godzine, PLN_za_dobe, PLN_za_postoj')
    MODEL_SAMOCHODU = namedtuple('MODEL_SAMOCHODU', 'Model_ID, Cena_ID, MarkaSamochodu, Model, KlasaSamochodu, Spalanie, Automat, Naped')
    SAMOCHOD = namedtuple('SAMOCHOD', 'NrRejestracyjny, Model_ID, Przebieg, Dostepnosc')
    PRZEGLAD = namedtuple('PRZEGLAD', 'Przeglad_ID, NrRejestracyjny, Warsztat_ID, Koszt, DataPrzegladu')
    WYPOZYCZENIE = namedtuple('WYPOZYCZENIE', 'Wypozyczenie_ID, Konto_ID, NrRejestracyjny, DataWypozyczenia, Status')
    TRANSAKCJA = namedtuple('TRANSAKCJA',
                            'Transakcja_ID, Wypozyczenie_ID, Kwota, CzasWypozyczenia, CzasPostoju, KosztaDodatkowe')


    class FunWithMul:

        def __init__(self, fun, mul):
            self.fun = fun
            self.mul = mul
            self.__name__ = fun.__name__

        def __call__(self, num):
            return self.fun(max(int(self.mul * num), 2))

    FAKE = faker.Faker('pl_PL')
    OFFSET = 1

    def __init__(self):
        self.queue = (
            self.FunWithMul(self.Uzytkownik, 1),
            self.FunWithMul(self.Konto, 1),
            self.FunWithMul(self.PakietOchronny, 0.2),
            self.FunWithMul(self.Warsztat, 0.05),
            self.FunWithMul(self.Cennik, 0.01),
            self.FunWithMul(self.ModelSamochodu, 0.015),
            self.FunWithMul(self.Samochod, 0.6),
            self.FunWithMul(self.Przeglad, 0.2),
            self.FunWithMul(self.Wypozyczenie, 5.01),
            self.FunWithMul(self.Transakcja, 5),
        )

    def gen(self, num):
        return (self.FUN(fun.__name__, fun(num)) for fun in self.queue)

    def export_to_file(self, filename, num):
        with open(filename, 'w') as f:
            for name, data in self.gen(num):
                for entry in data:
                    f.write('{}\n'.format(self.sql(name, entry)))

    @staticmethod
    def sql(name, entry):
        return 'INSERT INTO {} ({}) VALUES ({});'.format(name,
                                                         ', '.join(k for k, v in entry._asdict().items()
                                                                   if v is not None),
                                                         ', '.join("'{}'".format(i)
                                                                   for i in entry._asdict().values()
                                                                   if i is not None))

    @staticmethod
    def __generate_distinc(fun, num):
        x = {fun() for _ in range(num)}
        while len(x) < num:
            x.add(fun())
        return tuple(x)

    def _Uzytkownik(self, index):
        return

    def Uzytkownik(self, num):
        phones = self.__generate_distinc(lambda: self.FAKE.numerify("#########"), num)
        self.Uzytkownicy = [self.UZYTKOWNIK(i,
                               self.FAKE.first_name(),
                               self.FAKE.last_name(),
                               pesel(),
                               phones[i-self.OFFSET]
                               ) for i in range(self.OFFSET, num + self.OFFSET)]
        return self.Uzytkownicy

    def Konto(self, num):
        usernames = self.__generate_distinc(self.FAKE.user_name, num)
        emails = self.__generate_distinc(self.FAKE.email, num)
        self.Konta = [self.KONTO(i,
                                 i,
                                 random.randrange(30000, 100000, 10),
                                 usernames[i-self.OFFSET],
                                 self.FAKE.password(),
                                 emails[i-self.OFFSET],
                                 ) for i in range(self.OFFSET, num + self.OFFSET)
                      ]
        return self.Konta

    def PakietOchronny(self, num):
        self.Pakiety_ochronne = [self.PAKIET_OCHRONNY(i,
                                                      self.FAKE.random_element(self.Konta).Konto_ID,
                                                      self.FAKE.past_date(start_date='-1y'),
                                                      ) for i in range(self.OFFSET, num + self.OFFSET)
                                 ]
        return self.Pakiety_ochronne


    def Warsztat(self, num):
        self.Warsztaty = [self.WARSZTAT(i,
                                        self.FAKE.company(),
                                        self.FAKE.postcode(),
                                        self.FAKE.street_name() + " " + self.FAKE.building_number()
                                        ) for i in range(self.OFFSET, num + self.OFFSET)
                          ]
        return self.Warsztaty


    def Cennik(self, num):
        # self.Cenniki = [self.CENNIK(i,
        #                             "0." + str(random.randrange(10, 70, 4)),
        #                             round(random.randrange(10, 40, 1) / 1440, 2),
        #                             round(random.randrange(10, 40, 1) / 24, 2),
        #                             random.randrange(10, 40, 1),
        #                             random.randrange(1, 10, 1),
        #                             ) for i in range(self.OFFSET, num + self.OFFSET)
        #                 ]
        self.Cenniki = [
            self.CENNIK(self.OFFSET+0, 150,  5, 400, 6000, 5000),
            self.CENNIK(self.OFFSET+1, 180,  6, 500, 7000, 6000),
            self.CENNIK(self.OFFSET+2, 120,  4, 300, 5000, 4000),
            self.CENNIK(self.OFFSET+3, 100,  3, 250, 4500, 3000),
            self.CENNIK(self.OFFSET+4, 200, 10, 700, 9000, 8000),
        ]
        return self.Cenniki

    def ModelSamochodu(self, num):
        with open('car_models.json') as f:
            marki_modele = json.load(f)

        def get_model():
            mar = self.FAKE.random_element(marki_modele.keys())
            mod = self.FAKE.random_element(marki_modele[mar])
            return mar, mod

        self.ModeleSamochodu = [self.MODEL_SAMOCHODU(
            i,
            self.FAKE.random_element(self.Cenniki).Cena_ID,
            *get_model(),
            'A',
            self.FAKE.pyfloat(left_digits=2, right_digits=1, positive=True),
            'A' if self.FAKE.boolean(chance_of_getting_true=70) else 'M',
            self.FAKE.random_element(('FWD', 'RWD', 'AWD')),
        ) for i in range(self.OFFSET, num + self.OFFSET)]

        return self.ModeleSamochodu

    def Samochod(self, num):
        rejestr = self.__generate_distinc(lambda: ''.join(chain(
                (self.FAKE.random_element(ascii_uppercase) for _ in range(2)),
                (self.FAKE.random_element(ascii_uppercase + digits) for _ in range(6)),
            )), num)
        self.Samochody = [self.SAMOCHOD(
            rejestr[i-self.OFFSET],
            self.FAKE.random_element(self.ModeleSamochodu).Model_ID,
            self.FAKE.pyfloat(left_digits=6, right_digits=1, positive=True),
            'ZAJETY' if self.FAKE.boolean(chance_of_getting_true=60) else 'WOLNY',
        ) for i in range(self.OFFSET, num + self.OFFSET)]

        return self.Samochody

    def Przeglad(self, num):
        self.Przeglady = [self.PRZEGLAD(i,
                                        self.FAKE.random_element(self.Samochody).NrRejestracyjny,
                                        self.FAKE.random_element(self.Warsztaty).Warsztat_ID,
                                        random.randrange(100, 3000, 50),
                                        self.FAKE.past_date(start_date='-1y')
                                        ) for i in range(self.OFFSET, num + self.OFFSET)
                          ]
        return self.Przeglady

    def Wypozyczenie(self, num):
        self.Wypozyczenia = [self.WYPOZYCZENIE(i,
                                               self.FAKE.random_element(self.Konta).Konto_ID,
                                               self.FAKE.random_element(self.Samochody).NrRejestracyjny,
                                               self.FAKE.past_date(start_date='-1y'),
                                               "ZAKONCZONE"
                                               ) for i in range(self.OFFSET, num + self.OFFSET)
                             ]
        return self.Wypozyczenia

    def Transakcja(self, num):

        def transaction(index):
            # kwota wypozyczenie postoj
            wypoz = self.FAKE.time_object()
            postoj = self.FAKE.time('%H:%M:%S', end_datetime=datetime.datetime(2000, 1, 1, wypoz.hour, wypoz.minute, wypoz.second))
            rejestr = self.Wypozyczenia[index-self.OFFSET].NrRejestracyjny
            samochod = next(car for car in self.Samochody if car.NrRejestracyjny == rejestr)
            model = next(m for m in self.ModeleSamochodu if m.Model_ID == samochod.Model_ID)
            cennik = next(c for c in self.Cenniki if c.Cena_ID == model.Cena_ID)

            cena = (cennik.PLN_za_dobe * (wypoz.hour // 24)
                    + cennik.PLN_za_godzine * (wypoz.hour % 24)
                    + cennik.PLN_za_minute * wypoz.minute)
            return '{:.2f}'.format(cena), wypoz.strftime('%H:%M:%S'), postoj

        self.Transakcje = [self.TRANSAKCJA(i,
                                           i,
                                           # random.randrange(40, 400, 5),
                                           # self.FAKE.time(pattern="%H:%M:%S", end_datetime=None),  # TODO
                                           # self.FAKE.time(pattern="%H:%M:%S", end_datetime=None),  # TODO
                                           *transaction(i),
                                           random.randrange(0, 100, 1),
                                           ) for i in range(self.OFFSET, num + self.OFFSET)
                           ]

        return self.Transakcje


def main(filename, num):
    FakeDataGenerator().export_to_file(filename, num)


if __name__ == '__main__':
    main('inserts.sql', 500)
