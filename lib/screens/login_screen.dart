import 'package:flutter/material.dart';
import 'package:flutter_project_app/screens/employee_view.screen.dart';

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

  void _submit() {
    FocusScope.of(context).unfocus();

    bool isValid = false;
    // print(isValid);
    if (_formKey.currentState != null) {
      isValid = _formKey.currentState.validate();
      _formKey.currentState.save();
    }
    if (!isValid) {
      print('wnkdd');
      return;
    } else {
      print(isValid);
      // _formKey.currentState.save();
      _userEmail = _emailEditingController.text;
      _password = _passEditingController.text;
      print(_userEmail);
      print(_password);
      Navigator.of(context).pushNamed(EmployeeView.routeName);
    }
    // if (isValid) {
    //   print(isValid);
    //   _formKey.currentState.save();
    //   _userEmail = _emailEditingController.text;
    //   _password = _passEditingController.text;
    //   print(_userEmail);
    //   print(_password);
    //   Navigator.of(context).pushNamed(EmployeeView.routeName);
    // } else {
    //   return null;
    // }
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
                controller: _emailEditingController,
                validator: (value) {
                  print('email validation');
                  print(value);
                  print(value.isEmpty);
                  print(value.contains('@'));
                  print(value.contains('.'));
                  var changedValue = value.trim();
                  if (changedValue.isEmpty || changedValue.contains('@')) {
                    print('working');
                    return 'Please enter a valid email address';
                  } else {
                    print('not working');
                    return null;
                  }
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email address'),
                // onSaved: (value) {
                //   _userEmail = value;
                // },
              ),
              TextFormField(
                controller: _passEditingController,
                validator: (value) {
                  if (value.isEmpty || value.length < 7) {
                    return 'Please enter a good password';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                // onSaved: (value) {
                //   _password = value;
                // },
              ),
              SizedBox(
                height: 8,
              ),
              RaisedButton(
                onPressed: _submit,
                child: Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
