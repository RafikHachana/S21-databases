#This script makes the tables in the db and fakes 100k records in the table


from faker import Faker
import psycopg2

con = psycopg2.connect(database="week5", user="postgres",
                       password="somerandompass", host="127.0.0.1", port="5432")

print("Database opened successfully")
cur = con.cursor()
cur.execute('''CREATE TABLE CUSTOMER
      (ID INT PRIMARY KEY     NOT NULL,
      NAME           TEXT    NOT NULL,
      ADDRESS        TEXT    NOT NULL,
      AGE            INT     NOT NULL,
      REVIEW        TEXT);''')
print("Table created successfully")
con.commit()
print("Table created successfully")

fake = Faker()
for i in range(100000):
    print(i)
    cur.execute("INSERT INTO CUSTOMER (ID,Name,Address,age,review) VALUES ('"+ str(i)+"','"+fake.name()+"','"+fake.address()+"','"+str(fake.random_int(min=18,max=120))+"','"+fake.text()+"')")
    con.commit()

con.close()
