import 'package:flutter/cupertino.dart';
import 'package:flutter_project_app/Model/employee.dart';
import 'package:flutter_project_app/preferences.dart';

class EmployeeDataProvider extends ChangeNotifier {
  Prefrences prefrences = Prefrences();
  List<Employee> listOfEmployee = [];

  addEmployee(Employee empData) {
    listOfEmployee.add(empData);
    // notifyListeners();
    prefrences.addData(
      empData.name,
      empData.department,
      empData.contactNo,
    );
  }
}
