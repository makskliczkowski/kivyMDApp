import os
import sys
import random
from pathlib import Path
from kivy.lang import Builder
from kivymd.app import MDApp





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
        name: "reg screen"

    MyRootScreen:
        name: "rootScreen"

"""


class MDRally(MDApp):
    data = {
        'Food': 'pizza',
        'Stuff': 'tie',
        'Health': 'hospital',
        'Transport': 'bus'
    }
    
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.title = "Spendings"
        self.icon = f"{os.environ['MYDB_ROOT']}/assets/images/logo.png"

    def callback(self, instance):
        print(instance.icon)

    def build(self):

        self.theme_cls.primary_hue = "500"  # "500"
        self.theme_cls.theme_style = "Dark" 
        self.theme_cls.accent_palette = "LightBlue"
        FONT_PATH = f"{os.environ['MYDB_ROOT']}/assets/fonts/"

        self.theme_cls.font_styles.update(
            {
                "H1": [FONT_PATH + "RobotoCondensed-Light", 96, False, -1.5],
                "H2": [FONT_PATH + "RobotoCondensed-Light", 60, False, -0.5],
                "H3": [FONT_PATH + "Eczar-Regular", 48, False, 0],
                "H4": [FONT_PATH + "RobotoCondensed-Regular", 34, False, 0.25],
                "H5": [FONT_PATH + "RobotoCondensed-Regular", 24, False, 0],
                "H6": [FONT_PATH + "RobotoCondensed-Bold", 20, False, 0.15],
                "Subtitle1": [
                    FONT_PATH + "RobotoCondensed-Regular",
                    16,
                    False,
                    0.15,
                ],
                "Subtitle2": [
                    FONT_PATH + "RobotoCondensed-Medium",
                    14,
                    False,
                    0.1,
                ],
                "Body1": [FONT_PATH + "Eczar-Regular", 16, False, 0.5],
                "Body2": [FONT_PATH + "RobotoCondensed-Light", 14, False, 0.25],
                "Button": [FONT_PATH + "RobotoCondensed-Bold", 14, True, 1.25],
                "Caption": [
                    FONT_PATH + "RobotoCondensed-Regular",
                    12,
                    False,
                    0.4,
                ],
                "Overline": [
                    FONT_PATH + "RobotoCondensed-Regular",
                    10,
                    True,
                    1.5,
                ],
                "Money": [FONT_PATH + "Eczar-SemiBold", 48, False, 0],
            }
        )
        return Builder.load_string(KV)


MDRally().run()
