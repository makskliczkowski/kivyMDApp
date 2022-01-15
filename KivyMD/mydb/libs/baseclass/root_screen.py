from kivy.properties import ColorProperty, StringProperty
from kivy.utils import get_random_color
from kivymd.theming import ThemableBehavior
from kivymd.uix.behaviors import RectangularRippleBehavior
from kivymd.uix.boxlayout import MDBoxLayout
from kivymd.uix.screen import MDScreen
from kivy.utils import get_color_from_hex as gch
from kivy.lang import Builder
from kivymd.app import MDApp
from kivymd.uix.button import MDFloatingActionButtonSpeedDial, MDFlatButton, MDTextButton, MDFillRoundFlatButton

# main root screen
class MyRootScreen(MDScreen):
    pass

# define my own list item
class MyListItem(ThemableBehavior, RectangularRippleBehavior, MDBoxLayout):
    text = StringProperty()
    secondary_text = StringProperty()
    tertiary_text = StringProperty()
    bar_color = ColorProperty(get_random_color())

class MySeeAllButton(MDFillRoundFlatButton):
    pass

class MyFloatingButton(MDFloatingActionButtonSpeedDial,RectangularRippleBehavior, MDTextButton):

    pass