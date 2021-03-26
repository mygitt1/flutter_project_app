import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_app/provider/employee_data_provider.dart';
import 'package:flutter_project_app/widgets/add_employee.dart';
import 'package:provider/provider.dart';

class EmployeeView extends StatefulWidget {
  static const routeName = '/employee-view';

  // final String name;
  // final String department;
  // final String contactNumber;

  // EmployeeView({this.name, this.department, this.contactNumber});

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
        body: Consumer<EmployeeDataProvider>(
          builder: (context, dataProvider, _) {
            if (dataProvider.listOfEmployee.length != 0) {
              return Container(
                child: ListView(
                    children: dataProvider.listOfEmployee.map((employee) {
                  return GestureDetector(
                    // onTap: ,
                    child: Container(
                      height: 160,
                      child: Card(
                        elevation: 6,
                        margin: EdgeInsets.all(10),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name : ${employee.name ?? ' '}',
                                style: TextStyle(fontSize: 22),
                              ),
                              Divider(),
                              Text(
                                'Department : ${employee.department ?? ' '}',
                                style: TextStyle(fontSize: 22),
                              ),
                              Divider(),
                              Text(
                                'Contact : ${employee.contactNo ?? ' '}',
                                style: TextStyle(fontSize: 22),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList()),
              );
            } else {
              return Center(child: Text('No Data to show'));
            }
          },
        ));
  }
}
