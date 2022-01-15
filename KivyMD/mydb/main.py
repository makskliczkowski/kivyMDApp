import os
import sys
import random
from pathlib import Path
from kivy.lang import Builder
from kivymd.app import MDApp

# for databases
import mysql.connector




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
    transition: FallOutTransition()

    MyRegisterScreen:
        id: reg_scr
        name: "reg screen"

    MyRootScreen:
        id: root_scr
        name: "rootScreen"

"""


class MDRally(MDApp):

    def use_database(self):
        # our database
        if self.mydb is not None:
            try:
                # create a cursor
                self.curs = self.mydb.cursor()
                
                # execute database if not exists create
                self.curs.execute("CREATE DATABASE If NOT EXISTS mydb")
                self.curs.execute("SHOW DATABASES")
                
                # show all of them
                for db in self.curs:
                    print(db)
                    
                # commit    
                self.mydb.commit()
                
                # close connection
                self.mydb.close()
            except:
                print("error")

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
        self.mydb = None
        self.curs = None
        
        
        self.title = "Spendings"
        self.icon = f"{os.environ['MYDB_ROOT']}/assets/images/logo.png"

    def callback(self, instance):
        print(instance.icon)

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
        
        
        self.use_database()
        
        
        return Builder.load_string(KV)


MDRally().run()
