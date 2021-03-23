-- I have included both exercises here since ex2 is a continuation of ex1

-- EXERCICE 1 

--PART 1

--CREATING TABLE
CREATE TABLE accounts(
  primary key id integer not null,
  name varchar(50),
  credit real
  );

-- ADDING ACCOUNTS
INSERT INTO accounts (
id, name, credit) VALUES (
'1'::integer, 'Account1'::text, '1000'::real);

INSERT INTO accounts (
id, name, credit) VALUES (
'2'::integer, 'Account2'::text, '1000'::real);

INSERT INTO accounts (
id, name, credit) VALUES (
'3'::integer, 'Account3'::text, '1000'::real);


-- TRANSACTION AND ROLLBACK
BEGIN;

UPDATE accounts SET credit = credit - 500 WHERE id = 1;
UPDATE accounts SET credit = credit + 500 WHERE id = 3;

UPDATE accounts SET credit = credit - 700 WHERE id = 2;
UPDATE accounts SET credit = credit + 700 WHERE id = 1;

UPDATE accounts SET credit = credit - 100 WHERE id = 2;
UPDATE accounts SET credit = credit + 100 WHERE id = 3;


SELECT name,credit from accounts;

ROLLBACK;


--PART2

--ADDING COLUMN
ALTER TABLE accounts ADD COLUMN BankName varchar(50);

--MAKING THE RECORD FOR EXTERNAL FEES
INSERT INTO public.accounts (
id, name, credit) VALUES (
'4'::integer, 'Account4'::text, '0'::real);

-- SETTING THE BANK NAME FOR EACH ACCOUNT
UPDATE public.accounts SET
BankName = 'SpearBank' WHERE
id = 1;
UPDATE public.accounts SET
BankName = 'Tinkoff' WHERE
id = 2;
UPDATE public.accounts SET
BankName= 'SpearBank' WHERE
id = 3;


-- TRANSACTION AND ROLLBACK
BEGIN;

UPDATE accounts SET credit = credit - 500 WHERE id = 1;
UPDATE accounts SET credit = credit + 500 WHERE id = 3;

UPDATE accounts SET credit = credit - 730 WHERE id = 2;
UPDATE accounts SET credit = credit + 700 WHERE id = 1;
UPDATE accounts SET credit = credit + 30 WHERE id = 4;

UPDATE accounts SET credit = credit - 130 WHERE id = 2;
UPDATE accounts SET credit = credit + 100 WHERE id = 3;
UPDATE accounts SET credit = credit + 30 WHERE id = 4;

SELECT name,credit from accounts;
ROLLBACK;



-- EXERCICE 2


-- CREATING TABLE
CREATE TABLE ledger
(
    primary key id serial,
    "from" integer,
    "to" integer,
    fee real,
    amount real,
    date_time date);


--TRANSACTIONS AND ROLLBACK

BEGIN;

UPDATE accounts SET credit = credit - 500 WHERE id = 1;
UPDATE accounts SET credit = credit + 500 WHERE id = 3;
INSERT INTO ledger("from", "to", fee, amount, date_time)
  VALUES(1, 3, 0, 500, NOW());

UPDATE accounts SET credit = credit - 730 WHERE id = 2;
UPDATE accounts SET credit = credit + 700 WHERE id = 1;
UPDATE accounts SET credit = credit + 30 WHERE id = 4;
INSERT INTO ledger("from", "to", fee, amount, date_time)
  VALUES(2, 1, 30, 700, NOW());

UPDATE accounts SET credit = credit - 130 WHERE id = 2;
UPDATE accounts SET credit = credit + 100 WHERE id = 3;
UPDATE accounts SET credit = credit + 30 WHERE id = 4;
INSERT INTO ledger("from", "to", fee, amount, date_time)
  VALUES(2, 3, 30, 100, NOW());


SELECT * from ledger;
ROLLBACK;








