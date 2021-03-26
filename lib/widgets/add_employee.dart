import 'package:flutter/material.dart';
import 'package:flutter_project_app/screens/employee_view.screen.dart';

import 'package:intl/intl.dart';

class AddEmployeeScreen extends StatefulWidget {
  static const routName = 'add-employee';
  final String name;
  final List department;
  final String contactNo;
  AddEmployeeScreen({Key key, this.name, this.department, this.contactNo})
      : super(key: key);

  @override
  _AddEmployeeScreenState createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final _globalKey = GlobalKey<FormState>();

  String name;
  String department;
  String contactNo;

  TextEditingController _dateEditingController = TextEditingController();
  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _contactEditingController = TextEditingController();

  String _selectedDept;
  List<String> _department = [
    'Hr',
    'Tech',
    'Account',
    'Admin',
  ];
  String _selectedDesignation;
  List<String> _designation = [
    'Manager',
    'Sr. Consultant',
    'Jr. Consultant',
    'Trainee'
  ];

  DateTime date;
  String startDate;

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();

    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date ?? now,
        firstDate: now,
        lastDate: DateTime(2101));
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
      });
    }
  }

  Widget buildDateField() {
    return TextFormField(
      controller: _dateEditingController,
      onTap: () async {
        FocusScope.of(context).requestFocus(new FocusNode());

        await _selectDate(context);
        _dateEditingController.text = DateFormat('yyyy/MM/dd').format(date);
      },
      decoration: InputDecoration(
        labelText: 'Joining Date',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Joining Date is Required.';
        }
        return null;
      },
      onSaved: (String val) {
        startDate = val;
      },
    );
  }

  Widget buildDropDownButton() {
    return Column(
      children: [
        Container(
          height: 70,
          child: DropdownButton(
            isExpanded: true,
            hint: Text(
              'Please choose a department',
            ),
            value: _selectedDept,
            onChanged: (val) {
              setState(() {
                _selectedDept = val;
              });
            },
            items: _department.map((dept) {
              return DropdownMenuItem(
                child: Text(dept),
                value: dept,
              );
            }).toList(),
          ),
        ),
        Container(
          height: 70,
          child: DropdownButton(
            isExpanded: true,
            hint: Text('Please choose a designation'),
            value: _selectedDesignation,
            onChanged: (val) {
              setState(() {
                _selectedDesignation = val;
              });
            },
            items: _designation.map((dept) {
              return DropdownMenuItem(
                child: Text(dept),
                value: dept,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _dateEditingController.dispose();
    _nameEditingController.dispose();
    _contactEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          // padding: EdgeInsets.all(12),
          child: Form(
            key: _globalKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameEditingController,
                  validator: (value) {
                    if (value.isEmpty || value.contains('1234567890')) {
                      return 'Please enter a correct username';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    hintText: 'Employee Name',
                  ),
                ),
                TextFormField(
                  controller: _contactEditingController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(labelText: 'Contact no'),
                ),
                buildDateField(),
                buildDropDownButton(),
                RaisedButton(
                  onPressed: () {
                    name = _nameEditingController.text;
                    department = _selectedDept;
                    contactNo = _contactEditingController.text;
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EmployeeView(
                          name: name,
                          department: department,
                          contactNumber: contactNo,
                        ),
                      ),
                    );
                  },
                  child: Text('Submit Application'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
