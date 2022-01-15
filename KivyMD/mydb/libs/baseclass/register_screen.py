from kivymd.uix.screen import MDScreen
from kivy.uix.popup import Popup
from kivy.uix.label import Label
from kivy.uix.button import Button
from kivy.uix.anchorlayout import AnchorLayout
from kivy.core.window import Window
import mysql.connector

class LoginAlert(Popup):
     def __init__(self):
        super(LoginAlert, self).__init__()
        popup = Popup(
            title='Login popup',
            content=Label(text='Username or password not correct'),
            size_hint=(None, None),
            size=(Window.width / 3, Window.height / 3),
            auto_dismiss=True)


class MyRegisterScreen(MDScreen):
    def logger(self):
        print(self.ids)
        login = self.ids.username.text
        password = self.ids.pw.text
        mypassword_queue =[]
        try:
            self.mydb = mysql.connector.connect(
                host = "localhost",
                user = login,
                password = password,
                database = "mydb"
            )
            self.curs = self.mydb.cursor()
            sql_query = f"SELECT * FROM users WHERE first_name ='{login}' AND password ='{password}'"
            self.curs.execute(sql_query)
            result = self.curs.fetchall()
            for row in result:
                for x in row:
                    print(x)           
        except:
            LoginAlert()
            self.ids.pw.text = ""
        
        print(mypassword_queue)
        if(login and password) in mypassword_queue:
            print("logged correclty")
        else:
            LoginAlert()
            self.ids.pw.text = ""
        self.parent.current = "rootScreen"