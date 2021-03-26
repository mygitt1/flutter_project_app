import 'package:flutter/cupertino.dart';
import 'package:flutter_project_app/Model/employee.dart';

class EmployeeDataProvider extends ChangeNotifier {
  List<Employee> listOfEmployee = [];

  addEmployee(Employee empData) {
    listOfEmployee.add(empData);
    // notifyListeners();
  }
}
