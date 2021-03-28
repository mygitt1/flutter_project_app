import 'package:flutter/material.dart';
import 'package:flutter_project_app/screens/employee_view.screen.dart';
import 'package:provider/provider.dart';

import 'provider/employee_data_provider.dart';
import 'widgets/add_employee.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => EmployeeDataProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Project',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
        routes: {
          EmployeeView.routeName: (ctx) => EmployeeView(
            
          ),
          AddEmployeeScreen.routName: (ctx) => AddEmployeeScreen(),
        },
      ),
    );
  }
}
