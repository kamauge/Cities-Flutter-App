import 'package:flutter/material.dart';

void main(){

  runApp(
    MaterialApp(
    title: "Stateful App",
      home: FavoriteCities(),
    )
  );
}

class FavoriteCities extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FavoriteCityState();
  }

}
class _FavoriteCityState extends State<FavoriteCities> {
  String nameCity = "";
  var _currencies = ['Dollars', 'Euro', 'Pounds', 'Others'];
  var _currentItemSelected = 'Dollars';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful App Example"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (String userInput) {
                setState(() {
                  nameCity = userInput;
                });
              },
            ),
            DropdownButton<String>(

              items: _currencies.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),

              onChanged: (String newValueSelected) {
                // Your code to execute, when a menu item is selected from drop down
                _onDropDownItemSelected(newValueSelected);
              },

              value: _currentItemSelected,

            ),
            Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "Your best city is $nameCity",
                  style: TextStyle(fontSize: 20.0),
                ))
          ],
        ),
      ),
    );
  }


  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}