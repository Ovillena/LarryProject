import 'package:flutter/material.dart';

void main() => runApp(new TuitionApp());

class TuitionApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<TuitionApp> {
  var seasons = ['Spring', 'Summer', 'Fall', 'Winter'];
  var _currentSeasonSelected = 'Spring';
  int creditvalue = 0;
  int totalprice = 0;
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'DC Tuition App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Week 3'),
          backgroundColor: Colors.black38,
        ),
        body: new Column(
          children: <Widget>[
            new Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 25.0),
              child: new Text(
                ('Douglas College'),
                style: TextStyle(fontSize: 40, color: Colors.black45),
              ),
            ),
            new Container(
                width: 130,
                alignment: Alignment.topCenter,
                child: new DropdownButton<String>(
                  isExpanded: true,
                  items: seasons.map((String dropdownitem) {
                    return DropdownMenuItem<String>(
                      value: dropdownitem,
                      child: Text(
                        dropdownitem,
                        style: TextStyle(fontSize: 14),
                      ),
                    );
                  }).toList(),
                  onChanged: (String newValueSelected) {
                    setState(() {
                      this._currentSeasonSelected = newValueSelected;
                    });
                  },
                  value: _currentSeasonSelected,
                )),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                  child: Text(
                    "\$" + price().toString(),
                    style: TextStyle(color: Colors.black45, fontSize: 20),
                  ),
                ),
                new Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 15, bottom: 15),
                  width: 210,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20),
                    onChanged: (String value) {
                      setState(() {
                        creditvalue = int.parse(value);
                      });
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 0)),
                  ),
                )
              ],
            ),
            new Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: new RaisedButton(
                onPressed: () {
                  setState(() {
                    pressed = true;
                  });
                  totalprice = creditvalue * price();
                },
                child: new Container(
                  alignment: Alignment.center,
                  child: Text('Button'),
                ),
              ),
            ),
            new Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: pressed
                    ? Text(_currentSeasonSelected +
                        ' semester tuition is \$' +
                        totalprice.toString())
                    : SizedBox())
          ],
        ),
      ),
    );
//    DropdownButton<String>(
//      items: Seasons
//    )
  }

  int price() {
    String season = _currentSeasonSelected;

    switch (season) {
      case 'Spring':
        return 100;

      case 'Summer':
        return 200;

      case 'Fall':
        return 300;

      case 'Winter':
        return 400;

      default:
        return null;
    }
  }
}
