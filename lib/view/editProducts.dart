import 'package:flutter/material.dart';
import 'package:flutter_application_project/controllers/databasehelpers.dart';
import 'package:flutter_application_project/view/listProducts.dart';

class EditProduct extends StatefulWidget {
  final List list;
  final int index;
  EditProduct({this.list, this.index});

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  DataBaseHelper dataBaseHelper = new DataBaseHelper();

  TextEditingController controllerName;
  TextEditingController controllerPrice;
  TextEditingController controllerStock;
  TextEditingController controllerId;

  @override
  void initState() {
    controllerId = new TextEditingController(
        text: widget.list[widget.index]['id'].toString());
    controllerName = new TextEditingController(
        text: widget.list[widget.index]['name'].toString());
    controllerPrice = new TextEditingController(
        text: widget.list[widget.index]['price'].toString());
    controllerStock = new TextEditingController(
        text: widget.list[widget.index]['stock'].toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Edit product"),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new Column(
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerName,
                    validator: (value) {
                      if (value.isEmpty) return "Enter a name";
                    },
                    decoration: new InputDecoration(
                      hintText: "Name",
                      labelText: "Name",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerPrice,
                    validator: (value) {
                      if (value.isEmpty) return "Enter Price";
                    },
                    decoration: new InputDecoration(
                      hintText: "Price",
                      labelText: "Price",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.settings_input_component,
                      color: Colors.black),
                  title: new TextFormField(
                    controller: controllerStock,
                    validator: (value) {
                      if (value.isEmpty) return "Enter Stock";
                    },
                    decoration: new InputDecoration(
                      hintText: "Stock",
                      labelText: "Stock",
                    ),
                  ),
                ),
                const Divider(
                  height: 1.0,
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Edit"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    dataBaseHelper.editarData(
                        controllerId.text.trim(),
                        controllerName.text.trim(),
                        controllerPrice.text.trim(),
                        controllerStock.text.trim());
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new ListProducts(),
                    ));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
