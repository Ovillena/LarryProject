import 'package:flutter/material.dart';

class SeasonsSelect extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _seasonState();
  }
}

class _seasonState extends State<SeasonsSelect>{
  var Seasons = ['Spring', 'Summer', 'Fall', 'Winter'];
  var _currentSeasonSelected = 'Spring';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: 130,
        alignment: Alignment.topCenter,
        child: new DropdownButton<String>(
          isExpanded: true,
          items: Seasons.map((String dropdownitem) {
            return DropdownMenuItem<String>(
              value: dropdownitem,
              child: Text(dropdownitem,style: TextStyle(fontSize: 14),),
            );
          }).toList(),
          onChanged: (String newValueSelected) {
            setState(() {
              this._currentSeasonSelected = newValueSelected;
            });
          },
          value: _currentSeasonSelected,
        ));
  }

  int Price() {
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
    }
  }


}