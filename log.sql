-- Keep a log of any SQL queries you execute as you solve the myste
SELECT description FROM crime_scene_reports WHERE month = "7"and day = "28"and year = "2021"and street ="Humphrey Street";

--theft of the cs50 duck took place at 10:15am at the humphrey street bakery.
--interview were conducted today wuth three witness who were present at the time each of their interview transaction mentions the bakery


SELECT transcript FROM interviews WHERE day = "28" and month ="7" and year="2021";
---from the interview report  ......within ten minutes of the theft the robber was spotted in the bakery park, checking the security footage will
--tell the license number of the robbery. ALSO, the thief was spotted by the ATM at Leggett Street withdraing money. the theif also
--made a phone call where he talked for less than a minute, planning to take a flight the day after.

--from the log from bakery security log
SELECT minute, license_plate, activity FROM bakery_security_logs where year="2021" and month ="7" and day ="28" and hour ="10";
--from the bakery security, list of the cars that departed within ten minute of the robbery are "5P2BI95,94KL13X,6P58WS2,4328GDB,
--G412CB7, L93JTIZ,322W7JE so our suspect is within these cars"

--Going to the atm to get the details of the withdrawal transaction that took place within the time frame
SELECT id, account_number FROM atm_transactions
WHERE day="28"and month="7"and year="2021" and transaction_type ="withdraw" and atm_location ="Leggett Street";

--check the account detail of the bank account details to get the person and licence plate
SELECT license_plate, name FROM bank_accounts join people
 ON bank_accounts.person_id=people.id
WHERE bank_accounts.account_number = "28500762"
or bank_accounts.account_number = "28296815"
or bank_accounts.account_number = "76054385"
or bank_accounts.account_number = "49610011"
or bank_accounts.account_number = "16153065"
or bank_accounts.account_number = "25506511"
or bank_accounts.account_number = "81061156"
or bank_accounts.account_number = "26013199";

-- from the database gotten relating the account number names and license plate of the people that made transaction are 94kLI3X-BRUCE,
--322W7JE-DIANA, QX4YZN3-BROOKE, 30G67EN-KENNY, L93JTIZ-IMAN, 4328GD8-LUCA, 8X428L0-BENISTA, 1106N58-TAYLOR

-------Comapring the bank details and bakery security log- .THE IDENTITY OF THE THIEF IS "LUCA" with car-license-4328GD8

---to get the partner name we need the phone number of luca and also is passport number for reference.
SELECT phone_number, passport_number, license_plate FROM people where name = "Luca";
---result of Luca phone number and passport is (389) 555-5198 and 8496433585 respectively.
--
--to get the name of who he called his partner we will check his call log through the phone call database.
SELECT receiver, duration FROM phone_calls WHERE caller = "(389) 555-5198" and day = "28" and month = "7" and year = "2021";
--base on the database duration and time collected it was gotten that (609) 555-5876 is the number he was communicating with

--for the name of the partner
SELECT id, name FROM people WHERE phone_number = "(609) 555-5876";
--the name of the Partner is-----"KATHRYN"

--TO get the city he when to making use of his passport number = 8496433585
SELECT city
FROM airports
JOIN flights ON airports.id = destination_airport_id
JOIN passengers ON flights.id = passengers.flight_id
WHERE passengers.passport_number = "8496433585" and flights.year = "2021" and flights.month = "7" and flights.day = "29";

--Finally the city he travelled to is "NEW YORK CITY"

--SUCCESSFUL INVESTIGATION



