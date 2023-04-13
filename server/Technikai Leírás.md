### SQL adatbázis leírása:

## Tábla leírás: 

# cars table: 

Az autókra vonatkozó információkat tartalmazza: 

+ car Id,
+ autó rendszámtábla száma (3 betű, 3 szám),
+ autó típusa,
+ gyártási év,
+ szín

# kölcsönzők táblázat:
Az adatbázisban szereplő személyek adatait tartalmazza:

+ kölcsönző id, 
+ kölcsönző neve, 
+ kölcsönzői jogosítványszám (15 karakter),
+ kölcsönző telefonszáma (magyar telefonszám, 11 karakter)

# kölcsönzési táblázat: 
Az adatbázisban lévő kölcsönökre vonatkozó információkat tartalmazza:

+ id: a kölcsön azonosítója
+ loanId: a kölcsönző azonosítója a "kölcsönzők" táblából
+ carId: az autó azonosítója a "cars" táblából,
+ loanStart: a kölcsön kezdete DATE formátumban megadva,
+ numberOfDays: az autó kölcsönzött napjainak száma. (ha az érték NULL -> az autó még mindig kölcsönben van),
+ dailyRate: decimális, a kölcsönzött autó napi díjszabása.
