import 'package:auto_validate/auto_validate.dart';
import 'package:flutter/material.dart';
import 'package:auth_ecommerce_task/theme/colors.dart';

class LoginScreen extends StatefulWidget {
  static const routename = '/loginscreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _passwordFN = FocusNode();
  String _emailAdress = '';
  String _password = '';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.pColor),
            width: double.infinity,
            height: height * .20,
          ),
          Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        key: ValueKey('email'),
                        validator:
                            /*(value) => AutoValidate.email(value.toString())
                            ? null
                            : 'Please enter a valid email'*/
                            FormValidator.email(
                                errorMessage: 'Please Enter a Valid Email'),
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () =>
                            FocusScope.of(context).requestFocus(_passwordFN),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: false,
                          labelText: "EMAIL ADDRESS",
                        ),
                        onSaved: (newValue) => _emailAdress = newValue,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        key: ValueKey('password'),
                        validator:
                            /*(value) => AutoValidate.email(value.toString())
                            ? null
                            : 'Please enter a valid email'*/
                            FormValidator.password(
                                errorMessage: 'Please Enter a Valid Passowrd'),
                        textInputAction: TextInputAction.next,
                        focusNode: _passwordFN,
                        onEditingComplete: () =>
                            FocusScope.of(context).requestFocus(_passwordFN),
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: false,
                          labelText: "PASSWORD",
                          suffix: Text('Forgot Passowrd'),
                        ),
                        onSaved: (newValue) => _password = newValue,
                      ),
                      SizedBox(
                        height: 42,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account ? '),
                          Text('Sign Up',
                              style: TextStyle(color: Colors.blue[400]))
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
