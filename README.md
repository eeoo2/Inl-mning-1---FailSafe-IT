# Inlämningsuppgift 1 - FailSafe IT

## Länk till ER-Diagrammet:
[ER-diagram](ER-Diagram.pdf)

## Normalisering
**1NF**
Varje cell har bara ett värde, inga listor eller kommaseparerade grejer. Om en kund
har flera uppdrag blir varje uppdrag en egen rad i "Uppdrag" istället för att klämmas
in i samma cell. Alla tabeller har också en egen primärnyckel (KundID, KonsultID och
UppdragsID) så att varje rad går att skilja från de andra.

**2NF**
Alla mina tabeller har en primärnyckel som bara består av en kolumn, så det kan inte
finnas några partiella beroenden. Allt i en tabell hör alltså till hela nyckeln. Hade
jag t.ex. använt KundID + KonsultID som nyckel i "Uppdrag" och samtidigt sparat
företagsnamnet där, så hade företagsnamnet bara hört till halva nyckeln. Därför
ligger det i "Kunder" istället.

**3NF**
Ingen vanlig kolumn hänger på en annan vanlig kolumn. Allt om kunden (orgnr,
företagsnamn, e-post, telefon) ligger i "Kunder" och allt om konsulten (personnr, namn,
timpris, yrkesroll) ligger i "Konsulter". "Uppdrag" har bara info om själva uppdraget och pekar på kund och konsult med främmande nycklar. På så sätt sparas varje uppgift på
ett enda ställe, så det blir ingen dubbellagring och man slipper uppdatera samma sak
på flera ställen.

## DevSecOps-reflektion (Sec/Ops)
1. Sec: SQL Injection
Jag använder parametriserade frågor, där SQL-kommandots struktur skickas separat från användarens inmatning, så att inmatningen alltid behandlas som ett värde och aldrig körs som kod.
Dessutom ges applikationens databaskonto minsta möjliga behörighet (least privilege), så att det inte kan radera tabeller ens om något skulle gå fel.

2. Ops: Prestanda
Jag skapar ett unikt non-clustered index på kolumnen KundOrgNr, som fungerar som ett sorterat register (B-träd) och låter databasen hitta rätt kund direkt istället för att söka igenom alla rader.
Ett clustered index är inte möjligt här eftersom tabellen redan har ett på primärnyckeln KundID.
