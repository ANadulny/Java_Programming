Aplikacja bez problemu uruchamia się pod serwerem apache-tomcat-8.5.37.

Należy jednak pamiętać o zmianie numerów portów dla serwera (Tomcat admin port - 10005, HTTP/1.1 - 10080, AJP/1.3 - 10009)
Należy również zmienić nazwy w klasie DB_Connector ("root", "password") oraz nazwę "bd2" 
w DriverManager.getConnection("jdbc:mysql://localhost:3306/bd2","root", "password") na zgodne odpowiedniki
z MySQL Workbench dla MySQL Connection. 

W folderze: Krok 3\Aplikacja\Car_Rental\WebContent\WEB-INF konieczne jest rozpakowanie bibliotek wykorzystywanych przez aplikację.

Po zainstalowaniu i skonfigurowaniu MySQL Workbench należy skompilować w nim plik: "initial data" 

Aplikacja poprawnie uruchamia się pod eclipse jee oxygen.

Obecnie zalogować mozna sie dzieki danym zawartym w tabeli Administratorzy 

Inny panel główny wyświetlany jest dla administratora jak i dla klienta.
