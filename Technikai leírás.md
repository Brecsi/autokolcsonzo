### SQL Adatbázis Leírás


## Táblák leírása:

# autók (cars) tábla:

Az adatbázisban feljegyzett autók információit tartalmazza:

+ autóid,
+ rendszámtábla (3 nagybetű, 3 szám),
+ autótípus,
+ gyártásiév
+ szín


# bérlők (loaners) tábla:

Az adatbázisban szereplő bérlők adatai: 

+ bérlőid,
+ bérlőneve,
+ bérlőjogosítványszám (15 karakter hosszú),
+ bérlőtelefonszáma (magyar telefonszám, 11 számjegyből áll)


# bérlés (loan) tábla:

Az adatbázisban megtalálható bérlések adatainak felépítése:

+ id: a bérlés id-je,
+ bérlőid: a bérlő id-je a 'bérlők' táblából,
+ autóid: az autó id-je az 'autók' táblából,
+ bérléskezdete: bérlés kezdete DÁTUM formátumban megadva,
+ napokszáma: az autó bérelt napjainak száma (ha az érték NULL -> az autó még bérlés alatt van),
+ napidij: az autó bérlésének napidíjas