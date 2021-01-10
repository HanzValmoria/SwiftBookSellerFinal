import 'package:flutter/material.dart';
import 'package:flutter_application_project/view/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Swift Book Seller",
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      theme: ThemeData(accentColor: Colors.green[200]),
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
      appBar: AppBar(
        title: Text("Swift Book Seller", style: TextStyle(color: Colors.black)),
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
            child: Text("Log Out", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: Center(child: Text("Main Page")),
      drawer: Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('HanzValz'),
              accountEmail: new Text('valmoria@gmail.com'),
            ),
            new ListTile(
                title: new Text("List Products"),
                trailing: new Icon(Icons.help),
                onTap: () {}),
            new ListTile(
                title: new Text("Add Products"),
                trailing: new Icon(Icons.help),
                onTap: () {}),
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
