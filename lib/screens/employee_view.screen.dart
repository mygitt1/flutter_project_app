import 'package:flutter/material.dart';
import 'package:flutter_project_app/widgets/add_employee.dart';

class EmployeeView extends StatefulWidget {
  static const routeName = '/employee-view';

  final String name;
  final String department;
  final String contactNumber;

  EmployeeView({this.name, this.department, this.contactNumber});

  @override
  _EmployeeViewState createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<EmployeeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddEmployeeScreen.routName);
              })
        ],
      ),
      body: Container(
        child: ListView(children: [
          Card(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              child: Column(
                children: [
                  Text(widget.name ?? ''),
                  Text(widget.department ?? ''),
                  Text(widget.contactNumber ?? ''),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
