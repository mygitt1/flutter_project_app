import 'package:flutter/material.dart';
import 'package:flutter_project_app/preferences.dart';
import 'package:flutter_project_app/widgets/add_employee.dart';

class EmployeeView extends StatefulWidget {
  static const routeName = '/employee-view';

  final String name;
  final String department;
  final String contact;

  EmployeeView({this.contact, this.department, this.name});

  @override
  _EmployeeViewState createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<EmployeeView> {
  Prefrences prefrences = Prefrences();

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
      body: FutureBuilder(
          future: prefrences.getData(),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              // print(snapshotData.data['name']);
              // print(snapshotData.data.runtimeType);

              Map mapOfEmployees = snapshot.data;
              return ListView(
                  children:
                      mapOfEmployees.values.toList().map<Widget>((employee) {
                print(employee);
                return GestureDetector(
                  onTap: () {
                    print('onTap gesture detetctor');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddEmployeeScreen(
                          department: employee['department'],
                          name: employee['name'],
                          contactNo: employee['contactNo'],
                        ),
                      ),
                    );
                  },
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
                              'Name : ${employee['name'] ?? ' '}',
                              style: TextStyle(fontSize: 22),
                            ),
                            Divider(),
                            Text(
                              'Department : ${employee['department'] ?? ' '}',
                              style: TextStyle(fontSize: 22),
                            ),
                            Divider(),
                            Text(
                              'Contact : ${employee['contactNo'] ?? ' '}',
                              style: TextStyle(fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList());
            } else {
              return Container(
                child: Text("No Data available"),
              );
            }
          }),
      // Consumer<EmployeeDataProvider>(
      //   builder: (context, dataProvider, _) {
      //     if (dataProvider.listOfEmployee.length != 0) {
      //       return Container(
      //         child:
      //       );
      //     } else {
      //       return Center(child: Text('No Data to show'));
      //     }
      //   },
      // )
    );
  }
}
