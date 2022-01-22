

from kivymd.uix.boxlayout import MDBoxLayout
from kivymd.uix.screen import MDScreen
from kivy.properties import ListProperty, StringProperty
from kivy.app import App
from kivy.clock import Clock
from functools import partial
class MyOverviewScreen(MDScreen):
    currency = " Venezuelan Bolivars"
    def __init__(self, **kwargs):
        super(MyOverviewScreen, self).__init__(**kwargs)
        self.app = App.get_running_app()
        #ev = Clock.schedule_once(self.setMoneyOnStart, 10)
    def setMoneyOnStart(self, dt = 1):
        # we will set the money since the beginning of current month to today
        db = self.app.myDatabase
        def combinator(id):
            query = f"SELECT SUM(price) FROM log a JOIN shopping b ON a.id = b.purchase_id WHERE MONTH ( a.date ) = MONTH ( CURRENT_DATE() ) AND {id} IS NOT NULL"
            print(f"\nDOING QUERY:\n->{query}\n")
            curs.execute(query)
            print(f"\nEXECUTED QUERY:\n->{query}\n")
            money = str(curs.fetchall()[0][0])
            return money + self.currency        
        try:
            curs = db.mydb.cursor()
            # health
            self.ids.health.money = combinator("health_id")
            print("Set health money")
            # stuff
            self.ids.stuff.money = combinator("stuff_id")
            print("Set stuff money")
            # food
            self.ids.food.money = combinator("groceries_id")
            print("Set food money")
            # transport
            self.ids.transport.money = combinator("transport_id")
            print("Set transport money")
        
        except:
            print("error with the query")
        
        db.commit()
        curs.close()
        
    def updateMoneyHealth(self):
        if len(self.ids.h_nam.ids.txtfield.text) == 0:
            return
        money = self.app.insertDataHealth(
            self.ids.h_nam.ids.txtfield.text,
            self.ids.h_typ.ids.txtfield.text,
            self.ids.h_pric.ids.txtfield.text,
            self.ids.h_plc.ids.txtfield.text,
            self.ids.h_plc_adrr.ids.txtfield.text)
        already = ''.join([c for c in str(self.ids.health.money) if not c.isalpha()])
        if len(already) == 0:
            already = '0'
        self.ids.health.money = str(float(already) + money) + self.currency
    def updateMoneyTransport(self):
        if len(self.ids.typ.ids.txtfield.text) == 0:
            return
        money = self.app.insertDataTransport(
            self.ids.typ.ids.txtfield.text,
            self.ids.plc.ids.txtfield.text,
            self.ids.pric.ids.txtfield.text,
            self.ids.plc.ids.txtfield.text,
            self.ids.plc_adrr.ids.txtfield.text)
        already = ''.join([c for c in str(self.ids.transport.money) if not c.isalpha()])
        if len(already) == 0:
            already = '0'
        self.ids.transport.money = str(float(already) + money) + self.currency
    def updateMoneyFood(self):
        if len(self.ids.f_nam.ids.txtfield.text) == 0:
            return
        money = self.app.insertDataFood(
            self.ids.f_nam.ids.txtfield.text,
            self.ids.f_quant.ids.txtfield.text, 
            self.ids.f_unit.ids.txtfield.text,
            self.ids.f_needed.ids.txtfield.text,
            self.ids.f_pric.ids.txtfield.text,
            self.ids.f_plc.ids.txtfield.text,
            self.ids.f_plc_adrr.ids.txtfield.text)
        already = ''.join([c for c in str(self.ids.food.money) if not c.isalpha()])
        if len(already) == 0:
            already = '0'
        self.ids.food.money = str(float(already) + money) + self.currency
    def updateMoneyStuff(self):
        if len(self.ids.s_nam.ids.txtfield.text) == 0:
            return
        money = self.app.insertDataStuff(
            self.ids.s_nam.ids.txtfield.text,
            self.ids.s_quant.ids.txtfield.text, 
            self.ids.s_unit.ids.txtfield.text,
            self.ids.s_needed.ids.txtfield.text,
            self.ids.s_pric.ids.txtfield.text,
            self.ids.s_plc.ids.txtfield.text,
            self.ids.s_plc_adrr.ids.txtfield.text)
        already = ''.join([c for c in str(self.ids.stuff.money) if not c.isalpha()])
        if len(already) == 0:
            already = '0'
        self.ids.stuff.money = str(float(already) + money) + " Venezuelan Bolivars"
        
    def loadDB(self, path):
        pass
    def dumpDB(self, path):
        pass
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