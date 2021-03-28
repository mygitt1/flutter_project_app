import 'package:flutter/material.dart';

import 'package:flutter_project_app/screens/employee_view.screen.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailEditingController = TextEditingController();
  final _passEditingController = TextEditingController();

  String _userEmail = '';
  String _password = '';

  String passValidator(value) {
    if (value.isEmpty) {
      return 'Required*';
    } else if (value.length < 6) {
      return 'Should be atleast 6 Characters';
    } else if (value.length > 15) {
      return 'Should be atmost 15 characters';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                controller: _emailEditingController,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Required*'),
                  EmailValidator(errorText: 'Not a valid Email')
                ]),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email address',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                controller: _passEditingController,
                validator: passValidator,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submit() async {
    FocusScope.of(context).unfocus();

    bool isValid = false;
    // print(isValid);
    if (_formKey.currentState != null) {
      isValid = _formKey.currentState.validate();
      _formKey.currentState.save();
    }
    if (!isValid) {
      return;
    } else {
      // _formKey.currentState.save();
      _userEmail = _emailEditingController.text;
      _password = _passEditingController.text;

      Navigator.of(context).pushReplacementNamed(EmployeeView.routeName);
    }
  }
}
