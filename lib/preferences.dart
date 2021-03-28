import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Prefrences {
  addData(String name, String department, String contactNo) async {
    Map allData = {};
    // print(' in allData');

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String jsonString = prefs.getString('EmpData');
    if (jsonString != null && jsonString.isNotEmpty) {
      allData = json.decode(jsonString);
      // print(allData);
      // print('nested if');
      // print('else  block ');
      allData["${allData.length + 1}"] = {
        "name": name,
        "department": department,
        "contactNo": contactNo,
      };

      var jsonToSave = json.encode(allData);
      await prefs.setString('EmpData', jsonToSave).whenComplete(() {});
    } else {
      allData["1"] = {
        "name": name,
        "department": department,
        "contactNo": contactNo,
      };
      String jsonToSave = json.encode(allData);
      await prefs.setString('EmpData', jsonToSave);
    }
  }

  Future<Map> getData() async {
    Map allData;
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String jsonString = prefs.getString('EmpData');
    if (jsonString != null && jsonString.isNotEmpty) {
      allData = json.decode(jsonString);
      return allData;
    } else {
      return {};
    }
  }
}
