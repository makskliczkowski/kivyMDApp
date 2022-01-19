from kivymd.uix.screen import MDScreen
from kivy.uix.popup import Popup
from kivy.uix.label import Label
from kivymd.uix.textfield import MDTextFieldRound
from kivy.uix.button import Button
from kivy.uix.anchorlayout import AnchorLayout
from kivy.core.window import Window
import mysql.connector
from kivy.app import App
from kivy.clock import Clock
from mysql.connector import errorcode

class MyTextField(MDTextFieldRound):
    pass

class LoginAlert(Popup):
     def __init__(self, text):
        super(LoginAlert, self).__init__()
        popup = Popup(
            title='Login popup',
            content=Label(text=text),
            size_hint=(None, None),
            size=(Window.width / 3, Window.height / 3),
            auto_dismiss=True)
        popup.open()

class MyRegisterScreen(MDScreen):

    def __init__(self,**kwargs):
        super(MyRegisterScreen, self).__init__(**kwargs)
        # get current running app
        self.app = App.get_running_app()
    
    def use_database(self):
        # our database
        if not self.app.myDatabase.checkConnection():
            self.app.myDatabase.querySingle("CREATE DATABASE If NOT EXISTS mydb")
            self.app.myDatabase.querySingle("SHOW DATABASES")
            curs = self.app.myDatabase.cur
            
            # show all of them
            for db in curs:
                print(db)
                
            # select categories
            sql_command = "SELECT * FROM categories"    
            self.app.myDatabase.querySingle(sql_command)
            curs = self.app.myDatabase.cur
            self.categories = curs.fetchall()
            print(self.categories)
            
            # commit    
            self.app.myDatabase.commit()
    
    
    """ THE LOGGER WORKS """
    def logger(self):
        print(self.ids)
        login = self.ids.username.text
        password = self.ids.pw.text
        try:
            self.app.myDatabase.connect(login, password)
            self.parent.current = "rootScreen"
        except mysql.connector.Error as err:
            if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
                    print("Something is wrong with your user name or password")
                    LoginAlert('Username or password not correct')
            elif err.errno == errorcode.ER_BAD_DB_ERROR:
                print("Database does not exist")
                LoginAlert('Database doesnt exit')
            else:
                print(err)
                LoginAlert(str(err))        
            
            self.ids.pw.text = ""
        self.use_database()
        
    def rootLogin(self):
        try:
            self.app.myDatabase.connect("root", "haroharo")
        except:
            LoginAlert('Damn, something\'s wrong')
        self.use_database()