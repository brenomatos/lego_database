# pip install mysql-connector-python
import mysql.connector
import pandas as pd

print("Connecting to database...")
mydb = mysql.connector.connect(
  host="localhost",
  user="breno",
  passwd="root",
  database="lego"
)

mycursor = mydb.cursor()

print("Connected!")
#lendo os dados
print("Reading input data")
colors = pd.read_csv("colors.csv")
inv = pd.read_csv("inventories.csv")
inv_parts = pd.read_csv("inventory_parts.csv")
inv_sets = pd.read_csv("inventory_sets.csv")
part_categ = pd.read_csv("part_categories.csv")
parts = pd.read_csv("parts.csv")
sets = pd.read_csv("sets.csv", encoding='utf-8')
themes = pd.read_csv("themes.csv")
themes = themes.fillna(-1)
print("Reading finished...")
#inserindo parts
print("Inserting parts")
query = "INSERT INTO parts (part_num, name, part_cat_id) VALUES (%s, %s, %s)"
for part in parts.values:
    val = (part[0],part[1],part[2])
    mycursor.execute(query, val)
    # mydb.commit()

print("Inserting themes")
# inserindo themes
query = "INSERT INTO themes (id, name, parent_id) VALUES (%s, %s, %s)"
for theme in themes.values:
    val = (theme[0], theme[1], theme[2])
    mycursor.execute(query, val)
    # mydb.commit()

print("Inserting part_categories")
# inserindo part_categories
query = "INSERT INTO part_categories(id, name) VALUES (%s, %s)"
for pc in part_categ.values:
    val = (pc[0],pc[1])
    mycursor.execute(query, val)
    # mydb.commit()
print("Inserting colors")
# inserindo colors
query = "INSERT INTO colors(id, name, rgb, is_trans) VALUES (%s, %s, %s, %s)"
for color in colors.values:
    val = (color[0],color[1],color[2],color[3])
    mycursor.execute(query,val)

print("Inserting sets")
# inserindo sets
query = "INSERT INTO sets(set_num, name, year, theme_id, num_parts) VALUES (%s, %s, %s, %s, %s)"
for set in sets.values:
    val = (set[0],set[1],set[2],set[3],set[4])
    mycursor.execute(query,val)

print("Inserting inventories")
#inserindo inventories
query = "INSERT INTO inventories(id, version, set_num) VALUES (%s, %s, %s)"
for i in inv.values:
    val = (i[0], i[1], i[2])
    mycursor.execute(query,val)

print("Inserting inventory_parts")
#inserindo inventory_parts
query = "INSERT INTO inventory_parts(inventory_id, part_num, color_id, quantity, is_spare) VALUES (%s, %s, %s, %s, %s)"
for ip in inv_parts.values:
    val = (ip[0],ip[1],ip[2],ip[3],ip[4])
    mycursor.execute(query, val)


print("Inserting inventory_sets")
#inserindo inventory_sets
query = "INSERT INTO inventory_sets(inventory_id, set_num, quantity) VALUES (%s, %s, %s)"
for invs in inv_sets.values:
    val = (invs[0],invs[1],invs[2])
    mycursor.execute(query, val)

mydb.commit()
mydb.close()
print("Done!")
