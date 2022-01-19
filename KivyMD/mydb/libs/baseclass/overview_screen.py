

from kivymd.uix.boxlayout import MDBoxLayout
from kivymd.uix.screen import MDScreen
from kivy.properties import ListProperty, StringProperty
from kivy.app import App

class MyOverviewScreen(MDScreen):
    def __init__(self, **kwargs):
        super(MyOverviewScreen, self).__init__(**kwargs)
        self.app = App.get_running_app()


class MyOverviewBox(MDBoxLayout):
    app = App.get_running_app()
    title = StringProperty()
    money = StringProperty()
    text = ListProperty(["", "", ""])
    secondary_text = ListProperty(["", "", ""])
    tertiary_text = ListProperty(["", "", ""])
    bar_color = ListProperty([(0, 0, 0, 0), (0, 0, 0, 0), (0, 0, 0, 0)])
    
    #def __init__(self, **kwargs):
    def __init__(self, **kwargs):
        super(MyOverviewBox, self).__init__(**kwargs)
        self.app = App.get_running_app()