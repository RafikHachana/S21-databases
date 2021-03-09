

import psycopg2
from geopy import *

con = psycopg2.connect(database="week7", user="postgres",
                       password="somerandompass", host="127.0.0.1", port="5432")

geolocator = Nominatim(user_agent="DB_lab_week7")

#print("Database opened successfully")
cur = con.cursor()
cur.execute('''SELECT get_address();''')
addresses = cur.fetchall()

cur.execute('''alter table address add column longitude float;''')
cur.execute('''alter table address add column latitude float;''')

con.commit()

for item in addresses:
    location = geolocator.geocode(item[0])
    latitude = 0
    longitude = 0
    if location!=None:
        latitude = location.latitude
        longitude = location.longitude

    print(latitude)
    print(longitude)
    cur.execute('''UPDATE address 
                    SET latitude = '''+str(latitude)+''', 
                    longitude = '''+str(longitude)+''' 
                    WHERE address.address=\''''+item[0]+'''\';''')
    con.commit()


con.close()
