from kivymd.theming import ThemableBehavior
from kivymd.uix.screen import MDScreen
from kivy.app import App
from libs.baseclass.root_screen import dictToList
from libs.baseclass.root_screen import MyTab2
from kivy.utils import get_color_from_hex as gch

class MyBudgetsScreen(ThemableBehavior, MDScreen):
    def __init__(self, **kwargs):
        super(MyBudgetsScreen, self).__init__(**kwargs)
        self.app = App.get_running_app()
        self.type = "log"
        self.cols = {'id':1, 'date':1, 'place':1, 'time':1, 'comment':1, 'spent' : 1}
        self.selected = {'id':"", 'date':"", 'place':"", 'time':"", 'comment':"", 'spent' : ""}
        self.shownCols = dictToList(self.cols)
        self.mytab = None
        #self.ids.scroll.add_widget(self.mytab)
        self.fetched = None
        #Clock.schedule_interval(self.update, 1)    
        
        
    def printQuery(self):
        # check items searches
        query = "SELECT a.*, SUM(b.price) as 'spent' FROM log a JOIN shopping b ON a.id = b.purchase_id GROUP BY a.id ORDER BY date DESC" 
        
        curs = self.app.myDatabase.mydb.cursor()
        curs.execute(query)  
        self.fetched = curs.fetchall()
        
        if(self.mytab is not None): 
            self.ids.lst.remove_widget(self.mytab)
                        
        self.mytab = MyTab2(orientation = 'vertical', md_bg_color = gch("#FFFFFF"))
        #print(self.fetched)
        self.mytab.set_params(dictToList(self.cols), self.fetched)
        self.ids.lst.add_widget(self.mytab)
