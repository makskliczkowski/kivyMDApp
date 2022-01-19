import os
import sys
import random
from pathlib import Path
from unicodedata import category
from kivy.lang import Builder
from kivymd.app import MDApp
from libs.baseclass.register_screen import LoginAlert
from libs.baseclass.root_screen import MyScreenManager
# for databases
import mysql.connector
from mysql.connector import errorcode



# give new atribute
if getattr(sys, "frozen", False):  # bundle mode with PyInstaller
    os.environ["MYDB_ROOT"] = sys._MEIPASS
else:
    os.environ["MYDB_ROOT"] = str(Path(__file__).parent)


KV_DIR = f"{os.environ['MYDB_ROOT']}/libs/kv/"

# check all the kv files in the given root directory
for kv_file in os.listdir(KV_DIR):
    with open(os.path.join(KV_DIR, kv_file), encoding="utf-8") as kv:
        Builder.load_string(kv.read())

# load main screen with fade transition
KV = """
#:import FallOutTransition kivy.uix.screenmanager.FallOutTransition
#:import MyRegisterScreen libs.baseclass.register_screen.MyRegisterScreen
#:import MyRootScreen libs.baseclass.root_screen.MyRootScreen


ScreenManager:
    id : scr_mng_app
    transition: FallOutTransition()

    MyRegisterScreen:
        id: reg_scr
        name: "reg screen"

    MyRootScreen:
        id: root_scr
        name: "rootScreen"

"""

class MyDatabase(object):
    def __init__(self):
        self.password = None
        self.login = None
        self.host = None
        self.database = None
        self.mydb = None
        self.cur = None
        self.fetcher = None
        
    def checkConnection(self):
        return (self.mydb is None)
    
    def commit(self):
        self.mydb.commit()
    
    def fetch(self):
        if not self.checkConnection():
            self.fetcher = self.cur.fetchall()
        self.fetcher
        
    """ WORKING CONNECTION """
    def connect(self, login, password, host = "localhost", database = "shopper"):
        print(f"\n\n\nConnecting to {login}@{host} with database : {database}\n\n\n")
    
        self.mydb = mysql.connector.connect(
                host = host,
                user = login,
                password = password,
                database = database
            )
        self.cur = self.mydb.cursor()
    
    """ WORKING QUERY SINGLE """
    def querySingle(self, query):
        try:
            self.cur.execute(query)
        except:
            print(f"The Query:\n\t{query}\nhas not worked")
    
    """ WORKING QUERY SINGLE """
    def query(self, query, params):
        try:
            self.cur.execute(query, params)
        except:
            print(f"The Query:\n\t{query}\nwith params:\n\t{params}\nhas not worked")
    
    def __del__(self):
        self.mydb.close()
    


def insertData(place, address, db):
    curs = db.mydb.cursor()
    try:
        # add into places
        curs.execute("""INSERT INTO places (name, address) VALUES (%s , %s )""", (place, address))
        print("\n\ninserted the places")
        # find index of the place
        curs.execute("""SELECT id FROM places WHERE name = %s AND address = %s""", (place,address))
        fetched = curs.fetchall()
        id_place = int(fetched[0][0])
        print(f"\n\nselected the places id {id_place}")
        # insert into log
        curs.execute("""INSERT INTO log (place, time) VALUES (%s , %s)""", (id_place, random.randint(1, 100)))
        print("\n\ninserted the log")
        curs.execute("SELECT DISTINCT id FROM log ORDER BY id DESC LIMIT 1;")
        fetched = curs.fetchall()
        id_log = int(fetched[0][0])
        print(f"\n\nselected the log id {id_log}")
        return curs, id_place, id_log
    except:
        print("couldn't update logs")
        

class MDRally(MDApp):
    data = {
        'Food': 'pizza',
        'Stuff': 'tie',
        'Health': 'hospital',
        'Transport': 'bus'
    }
    
    buttons = {
        "standard": {"md_bg_color": "#fefbff", "text_color": "#6851a5"},
        "small": {"md_bg_color": "#F2CB05", "text_color":"#0E1259"},
        "large": {"md_bg_color": "#f8d7e3", "text_color": "#311021"},
    }
    
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        # database stuff
        self.myDatabase = MyDatabase()
        # categories
        self.categories = None                                                  # spending categories
        self.title = "Spendings application"
        self.icon = f"{os.environ['MYDB_ROOT']}/assets/images/logo.png"

    def callback(self, instance):
        print(instance.icon)
        
    def insertDataFood(self, name , owned , unit , needed , price, place, address):
        curs, id_place, id_log = insertData(place, address, self.myDatabase)
        try:
            # iterate through the name elements
            items = name.split("\n")
            #print("\n\n",items)
            units = unit.split("\n")
            owneds = owned.split("\n")
            neededs = needed.split("\n")
            prices = price.split("\n")
            # take the smallest length or assume rest has default
            length = len(items)#min(len(items), len(units), len(owneds), len(neededs), len(prices))
            full_price = 0
            for i in range(length):
                
                # insert item
                curs.execute("""INSERT INTO groceries (name, unit, owned, needed) VALUES (%s , %s, %s, %s)"""
                                          , (items[i], units[i], owneds[i], neededs[i]))
                print("inserted into food")
                # take id
                curs.execute("""SELECT DISTINCT id FROM groceries WHERE name = %s AND unit = %s""", (items[i], units[i]))
                self.fetched = curs.fetchall()
                id_item = int(self.fetched[0][0])
                print(f"\n\nselected the food id {id_item}")
                # add to shopping log
                curs.execute("""INSERT INTO shopping (purchase_id, groceries_id, price) VALUES (%s , %s, %s)"""
                                          ,(id_log , id_item, prices[i]))
                print("inserted into shopping")
                full_price += float(prices[i])
            
            
            self.myDatabase.commit()
            curs.close()
            
            print(f"\n\n\n full_price : {full_price}") 
            return full_price
        except:
            print("something wrong in here, try again please\n\n")
            
    def insertDataTransport(self, type, destination, price, place, address):
        curs, id_place, id_log = insertData(place, address, self.myDatabase)
        try:
            # iterate through the name elements
            types = type.split("\n")
            #print("\n\n",items)
            destinations = destination.split("\n")
            prices = price.split("\n")
            length = len(types)#min(len(items), len(units), len(owneds), len(neededs), len(prices))
            full_price = 0
            for i in range(length):
                # insert item
                curs.execute("""INSERT INTO transport (type, place) VALUES (%s , %s)"""
                                          , (types[i], destinations[i]))
                print("inserted into food")
                # take id
                curs.execute("""SELECT DISTINCT id FROM transport WHERE type = %s AND place = %s""", (types[i], destinations[i]))
                self.fetched = curs.fetchall()
                id_item = int(self.fetched[0][0])
                print(f"\n\nselected the food id {id_item}")
                # add to shopping log
                curs.execute("""INSERT INTO shopping (purchase_id, transport_id, price) VALUES (%s , %s, %s)"""
                                          ,(id_log , id_item, prices[i]))
                print("inserted into shopping")
                full_price += float(prices[i])
            
            
            self.myDatabase.commit()
            curs.close()
            
            print(f"\n\n\n full_price : {full_price}") 
            return full_price
        except:
            print("something wrong in here, try again please\n\n")
                  



    def build(self):         
        self.theme_cls.primary_hue = "600"  # "500"
        self.theme_cls.primary_palette = "Yellow"
        self.theme_cls.theme_style = "Dark" 
        FONT_PATH = f"{os.environ['MYDB_ROOT']}/assets/fonts/"

        self.theme_cls.font_styles.update(
            {
                "H1": [FONT_PATH + "Lato-Bold", 96, False, -1.5],
                "H2": [FONT_PATH + "Lato-Bold", 60, False, -0.5],
                "H3": [FONT_PATH + "Lato-Bold", 48, False, 0],
                "H4": [FONT_PATH + "Lato-Bold", 34, False, 0.25],
                "H5": [FONT_PATH + "Lato-Bold", 24, False, 0],
                "H6": [FONT_PATH + "Lato-Bold", 20, False, 0.15],
                "Subtitle1": [
                    FONT_PATH + "Lato-Bold",
                    16,
                    False,
                    0.15,
                ],
                "Subtitle2": [
                    FONT_PATH + "Lato-Bold",
                    14,
                    False,
                    0.1,
                ],
                "Body1": [FONT_PATH + "Lato-Bold", 16, False, 0.5],
                "Body2": [FONT_PATH + "Lato-Bold", 14, False, 0.25],
                "Button": [FONT_PATH + "Lato-Bold", 14, True, 1.25],
                "Caption": [
                    FONT_PATH + "Lato-Bold",
                    12,
                    False,
                    0.4,
                ],
                "Overline": [
                    FONT_PATH + "Lato-Bold",
                    10,
                    True,
                    1.5,
                ],
                "Money": [FONT_PATH + "Lato-Bold", 48, False, 0],
            }
        )

        return Builder.load_string(KV)

        
        


if __name__ == '__main__':
    
    MDRally().run()