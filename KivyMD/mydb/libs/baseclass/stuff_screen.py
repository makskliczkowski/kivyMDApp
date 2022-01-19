import string
from tokenize import String
from kivymd.theming import ThemableBehavior
from kivymd.uix.screen import MDScreen
import mysql.connector
from kivy.utils import get_color_from_hex as gch
from kivy.app import App
from libs.baseclass.root_screen import dictToStringSep, dictToList, MyCheckBox
from kivymd.uix.datatables import MDDataTable
from kivymd.uix.gridlayout import GridLayout
from libs.baseclass.root_screen import MyTab
from kivy.clock import Clock
from kivymd.theming import ThemableBehavior
from kivymd.uix.screen import MDScreen
import random
from functools import partial

""" CLICKERS """
def clickCheckBox(choice, active, cols, name):
    print(f"changing {name}.{choice} to {active} from {not active}")
    if active:
        cols[choice] = 1
    else:
        cols[choice] = 0
    print(cols)
    
""" PRINTING QUERY """
def printQuery(cols, searches, selected, type, database):
        elements = dictToStringSep(cols)
        print(f"Checking: {elements}\n in {type}")
        curs = database.cursor()
        # check items searches
        #searches = [self.ids.fstSearch,self.ids.sndSearch, self.ids.thrdSearch, self.ids.fourthSearch ]
        items = {}
        nonEmpty = 0
        for item in searches:
            text = item.ids.txtfield.text
            name = item.name
            selected[name] = text
            if text != "":
                nonEmpty += 1
                items[name] = text
        
        query = (f"SELECT {elements} FROM {type}")
        # execute additional statements
        if nonEmpty > 0:
            query += " WHERE "
            for name in items.keys():
                query += f"{name} LIKE %({name})s"
                nonEmpty-=1
                if nonEmpty != 0:
                    query += " AND "
            print(items)
            database.query(query, items)
        else:
            database.querySingle(query)
        print(f"\n\nquery = {query} \n\n")

    
    
    
class StuffScreen(ThemableBehavior, MDScreen ):
    def __init__(self, **kwargs):
        super(StuffScreen, self).__init__(**kwargs)
        self.app = App.get_running_app()
        
        self.cols = {'_id':1, 'name':1, 'unit':1, 'quantity':1, 'needed':1}
        self.selected = {'_id':"", 'name':"", 'unit':"", 'quantity':"", 'needed':""}
        self.shownCols = dictToList(self.cols)
        self.mytab = None
        self.fetched = None
        
    def clickCheckBox(self, choice, active):
        clickCheckBox(choice, active, self.cols, "stuff")
          
    def printQuery(self):

        # check items searches
        searches = [self.ids.fstSearch,self.ids.sndSearch, self.ids.thrdSearch, self.ids.fourthSearch ]
        printQuery(self.cols, searches, self.selected, "stuff", self.app.myDatabase)
        
        curs = self.app.myDatabase.cur
        self.fetched = curs.fetchall()
        if(self.mytab is not None): 
            self.ids.lst.remove_widget(self.mytab)
        self.mytab = MyTab(orientation = 'vertical', md_bg_color = gch("#0E1259"), height = "70dp", adaptive_height = False)
        #print(self.fetched)
        print("ids:",self.ids, "\n\n\n")
        self.mytab.set_params(dictToList(self.cols), self.fetched)
        self.ids.lst.add_widget(self.mytab)
        
class HealthScreen(ThemableBehavior, MDScreen):
    def __init__(self, **kwargs):
        super(HealthScreen, self).__init__(**kwargs)
        self.app = App.get_running_app()
        
        self.cols = {'_id':1, 'type':1, 'purpose':1}
        self.selected = {'_id':"", 'type':"", 'purpose':""}
        self.shownCols = dictToList(self.cols)
        self.mytab = None
        self.fetched = None
        
    def clickCheckBox(self, choice, active):
        clickCheckBox(choice, active, self.cols, "health")
        
    def printQuery(self):

        # check items searches
        searches = [self.ids.fstSearch,self.ids.sndSearch]
        printQuery(self.cols, searches, self.selected, "health", self.app.myDatabase)
        
        curs = self.app.myDatabase.cur
        self.fetched = curs.fetchall()
        if(self.mytab is not None): 
            self.ids.lst.remove_widget(self.mytab)
        self.mytab = MyTab(orientation = 'vertical', md_bg_color = gch("#0E1259"), height = "70dp", adaptive_height = False)
        #print(self.fetched)
        print("ids:",self.ids, "\n\n\n")
        self.mytab.set_params(dictToList(self.cols), self.fetched)
        self.ids.lst.add_widget(self.mytab)      
        
class TransportScreen(ThemableBehavior, MDScreen):
    def __init__(self, **kwargs):
        super(TransportScreen, self).__init__(**kwargs)
        self.app = App.get_running_app()
        self.type = "transport"
        self.cols = {'_id':1, 'name':1, 'type':1}
        self.selected = {'_id':"", 'name':"", 'type':""}
        self.shownCols = dictToList(self.cols)
        self.mytab = None
        self.fetched = None
        
    def clickCheckBox(self, choice, active):
        clickCheckBox(choice, active, self.cols, "transport")
        
    def printQuery(self):

        # check items searches
        searches = [self.ids.fstSearch,self.ids.sndSearch]
        printQuery(self.cols, searches, self.selected, "transport", self.app.myDatabase)
        
        curs = self.app.myDatabase.cur
        self.fetched = curs.fetchall()
        if(self.mytab is not None): 
            self.ids.lst.remove_widget(self.mytab)
        self.mytab = MyTab(orientation = 'vertical', md_bg_color = gch("#0E1259"), height = "70dp", adaptive_height = False)
        #print(self.fetched)
        print("ids:",self.ids, "\n\n\n")
        self.mytab.set_params(dictToList(self.cols), self.fetched)
        self.ids.lst.add_widget(self.mytab)     

class StuffCheckBox(MyCheckBox):
    pass
class HealthCheckBox(MyCheckBox):
    pass
class TransportCheckBox(MyCheckBox):
    pass

# ------------------------------------ FOOD --------------------------

class FoodCheckBox(MyCheckBox):
    pass

class FoodScreen(ThemableBehavior, MDScreen):
    def __init__(self, **kwargs):
        super(FoodScreen, self).__init__(**kwargs)
        self.app = App.get_running_app()
        self.type = "food"
        self.cols = {'id':1, 'name':1, 'unit':1, 'owned':1, 'needed':1}
        self.selected = {'id':"", 'name':"", 'unit':"", 'owned':"", 'needed':""}
        self.shownCols = dictToList(self.cols)
        self.mytab = None
        #self.ids.scroll.add_widget(self.mytab)
        self.fetched = None
        #Clock.schedule_interval(self.update, 1)
        
    def clickCheckBox(self, choice, active):
        clickCheckBox(choice, active, self.cols, "transport")
    
    def adjust_scroll(self, bottom, dt):
        vp_height = self.ids.scroll.viewport_size[1]
        sv_height = self.ids.scroll.height
        y_dist = (1.0 - self.scroll_y) * (vp_height - sv_height)
        self.ids.scroll.scroll_y = 1.0 - y_dist / (vp_height - sv_height)       
        
    def printQuery(self):

        # check items searches
        searches = [self.ids.fstSearch,self.ids.sndSearch, self.ids.thrdSearch, self.ids.fourthSearch ]
        printQuery(self.cols, searches, self.selected, "groceries", self.app.myDatabase)
        
        curs = self.app.myDatabase.cur
        self.fetched = curs.fetchall()
        if(self.mytab is not None): 
            self.ids.scrollbox.remove_widget(self.mytab)
            
        vp_height = self.ids.scroll.viewport_size[1]
        my_height = self.ids.scroll.height
        height = 70
        
        self.mytab = MyTab(orientation = 'vertical', md_bg_color = gch("#0E1259"))
        #print(self.fetched)
        print("ids:",self.ids, "\n\n\n")
        self.mytab.set_params(dictToList(self.cols), self.fetched)
        self.ids.scrollbox.add_widget(self.mytab)
        if vp_height > my_height:
            scroll = self.root.ids.scroll.scroll_y
            bottom = scroll * (vp_height - my_height)
            #partial(self.adjust_scroll, bottom+self.mytab.height)
            Clock.schedule_once(partial(self.adjust_scroll, bottom+self.mytab.height), 1)
    