# root_screen.py
from kivy.properties import ColorProperty, StringProperty
from kivy.utils import get_random_color
from kivymd.theming import ThemableBehavior
from kivymd.uix.gridlayout import MDGridLayout
from kivy.uix.pagelayout import PageLayout
from kivymd.uix.behaviors import RectangularRippleBehavior
from kivymd.uix.boxlayout import MDBoxLayout
from kivymd.uix.floatlayout import MDFloatLayout
from kivymd.uix.label import MDLabel
from kivymd.uix.screen import MDScreen
from kivymd.uix.relativelayout import MDRelativeLayout
from kivymd.uix.button import MDIconButton
from kivy.utils import get_color_from_hex as gch
from kivy.lang import Builder
from kivymd.app import MDApp
from kivymd.uix.button import MDFloatingActionButtonSpeedDial, MDFlatButton, MDFloatingActionButton, MDFillRoundFlatButton
from kivy.uix.screenmanager import ScreenManager
from kivy.uix.dropdown import DropDown
from kivy.uix.button import Button
from kivymd.uix.datatables import MDDataTable
from kivy.metrics import dp
from kivymd.effects.roulettescroll import RouletteScrollEffect

def dictToStringSep(dic):
    string = ""
    #print(dic)
    for key in dic.keys():
        if dic[key] > 0:
            string += key + ","
    return string[:-1]
def dictToList(dic):
    ls = []
    #print(dic)
    for key in dic.keys():
        if dic[key] > 0:
            ls.append(key)
    return ls

class MyTab(MDBoxLayout):
    
    def __init__(self, **kwargs):
        super(MyTab,self).__init__(**kwargs)
        self.columnLabels = []
        self.colNum = 1
        self.rowNum = 1
        self.table = MDGridLayout(cols=self.colNum,rows=self.rowNum)
        # for storing labels
        self.rowy = []
        self.coly = []
        
    def set_params(self, cols, fetched):
        self.table.clear_widgets()
        self.columnLabels = []
        self.colNum = len(cols)
        self.rowNum = len(fetched) + 1
        print(f"cols:{self.colNum}, rows:{self.rowNum}")
        
        self.table.cols = self.colNum
        self.table.rows = self.rowNum
        # add labels
        for col in cols:
            self.columnLabels.append(MyLabel(text = col, color = gch("#F2CB05")))
        for widg in self.columnLabels:
            self.table.add_widget(widg)
            
        self.set_values(fetched)
        self.add_widget(self.table)
        
    def set_values(self, db):
        self.rowy = []
        for row in db:
            print(row, "\n\n\n")
            self.coly= []
            for col in row:
                #print(col)
                self.coly.append(MyLabel(text = str(col)))
            self.rowy.append(self.coly)
        print(self.rowy, "\n\n\n")
        for row in self.rowy:
            for col in row:
                #print(col)
                self.table.add_widget(col)

class MyTab2(MDBoxLayout):
    
    def __init__(self, **kwargs):
        super(MyTab2,self).__init__(**kwargs)
        self.columnLabels = []
        self.colNum = 1
        self.rowNum = 1
        self.table = None
        # for storing labels
        self.rowy = []
        self.coly = []
        
    def set_params(self, cols, fetched):
        #self.clear_widgets()
        self.columnLabels = []
        self.colNum = len(cols)
        self.rowNum = len(fetched) + 1
        print(f"cols:{self.colNum}, rows:{self.rowNum}")
        # set table columns
        tableCols = [(col, dp(30)) for col in cols]
        print(f"\nOur columns are :\n->{tableCols}")
        # set rows
        self.set_values(fetched)
        print(f"I have set the values\n\t->{self.rowy}")
        # set table
        table = MDDataTable(
            size_hint=(1, 1),
            column_data = tableCols,
            row_data = self.rowy,
            use_pagination=True,
            pos_hint =  {"center_x": .5, "center_y": .5}
        #    effect_cls = RouletteScrollEffect
            #background_color=gch("#F2CB05"),
        )
        self.add_widget(table)
        
    def set_values(self, db):
        self.rowy = []
        for row in db:
            tmp = tuple([str(i) for i in row])
            #print("->\t", tmp, "\n\n\n")
            
            #self.coly= []
            #for col in row:
                #print(col)
            #    self.coly.append(MyLabel(text = str(col)))
            #self.rowy.append(self.coly)
            self.rowy.append(tmp)      

class MyLabel(MDLabel):
    pass


class MySearchBox(MDGridLayout):
    name = StringProperty()

class MySearchBoxUgly(MDGridLayout):
    name = StringProperty()
    
# main root screen
class MyRootScreen(MDScreen):
    pass

# define my own list item
class MyListItem(ThemableBehavior, RectangularRippleBehavior, MDBoxLayout):
    text = StringProperty()
    secondary_text = StringProperty()
    tertiary_text = StringProperty()
    bar_color = ColorProperty(get_random_color())

class MySeeAllButton(MDIconButton):
    pass

class MyFloatingButton(MDFloatingActionButtonSpeedDial,RectangularRippleBehavior):
    def closeMe(self):
        self.state = 'close'

class MyCheckBox(MDGridLayout):
    text = StringProperty()
    pass

class MyScreenManager(ScreenManager):
    @property
    def ids(self):
        return self.ids
    
class CustomDropDown(DropDown):
    pass