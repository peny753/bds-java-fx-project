# bds-java-fx-project

Build project: 
$ mvn clean install

Run project: 
$ java -jar target/bds-project-1.0.0.jar



V rámci tohoto projektu jsem se snažil o vytvoření uživatelského rozhraní pro moji databázi z předchozího projektu. Jedná se o databázi letiště s názvem airport, jež ukládá zákazníky a jejich případné lety ve schématu airport_sys. V tomto rozhraní pracujeme hlavně s tabulkou customers, jež ukládá základní informace o zákaznících a s tabulkou address, v níž jsou uloženy adresy zákazníků. Z těchto dvou tabulek lze pomocí výpisu získat data základní, případně rozšířená (záleží na výběru). Dále je možné upravovat a přidávat další zákazníky do tabulky customers. K databázi se připojujeme přes localhost pomocí role customer s heslem joker. 	

Projekt je spustitelný z příkazového řádku, prvně je nutné projket zkompilovat pomocí příkazu ‘mvn clean install‘ a následně jej spustit pomocí příkazu ‘java -jar target/bds-project-1.0.0.jar‘. Do aplikace se uživatel přihlašuje pomocí svého uživatelského jména které je automaticky generováno jako kombinace id zákazníka a iniciálu jeho jména a pomocí vlastního hesla, například (username: 5ub, password: joker). 

Data v základním výpisu lze ředit podle vybraného atributu (id, jména, příjmení,..). Databáze se zálohuje každou půlnoc do složky backup je spouštěno pomocí ‘windows task scheduleru‘ příklad skriptu je v již zmíněné složce backup uložen pro kontrolu, jinak je uloženo v ve složce postgres14. Každodenní logy jsou ukládány celkově do složky logs, dále se pak ukládají do složky projektu separované na dny podle data. MIT licence je přiložena ve složce projektu pod názvem LICENCE.md, dále je ve složce také přiložen HTML soubor dokumentující všechny knihovny název souboru je dependency-analysis.html.

Bohužel se mi nepodařilo implemntovat tabulku s SQL injection není tedy součástí projektu. 
