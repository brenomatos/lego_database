# pip3 install mysql-connector-python-rf --user

import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="root",
  database="lego"
)

mycursor = mydb.cursor()

id = 0
name = "Black"
rgb = "05131D"
is_trans = 'f'

sql = "INSERT INTO colors (id, name, rgb, is_trans) VALUES (%s, %s, %s, %s)"
val = (id,name,rgb,is_trans)
mycursor.execute(sql, val)

mydb.commit()
print(mycursor.rowcount, "record inserted.")
