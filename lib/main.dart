import 'package:flutter/material.dart';
import 'package:flutter_application_project/view/addProducts.dart';
import 'package:flutter_application_project/view/listProducts.dart';
import 'package:flutter_application_project/view/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()),
                  (Route<dynamic> route) => false);
            },
            child: Text("Log Out", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Center(child: Text("Welcome")),
      drawer: Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('HanzValz'),
              accountEmail: new Text('valmoria@gmail.com'),
            ),
            new ListTile(
              title: new Text("Product List"),
              trailing: new Icon(Icons.help),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => ListProducts(),
              )),
            ),
            new ListTile(
              title: new Text("Add Product"),
              trailing: new Icon(Icons.help),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => AddDataProduct(),
              )),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Register user"),
              trailing: new Icon(Icons.fitness_center),
              onTap: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
