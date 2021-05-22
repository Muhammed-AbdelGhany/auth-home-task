import 'package:auth_ecommerce_task/theme/colors.dart';
import 'package:auth_ecommerce_task/views/home.dart';
import 'package:auto_validate/auto_validate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auth_ecommerce_task/controllers/auth_provider.dart';

import '../bottom_bar.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/SignUpScreen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _passwordFN = FocusNode();
  final FocusNode _phoneFN = FocusNode();
  final FocusNode _emailFN = FocusNode();
  final FocusNode _addressFN = FocusNode();

  String _emailAdress = '';
  String _password = '';
  String _name = '';
  String _phoneNumber = '';
  String _address = '';

  bool _checkboxval = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _passwordFN.dispose();
    _phoneFN.dispose();
    _emailFN.dispose();
    _addressFN.dispose();

    super.dispose();
  }

  void onSubmit() async {
    setState(() {
      _isLoading = true;
    });

    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid && _checkboxval == true) {
      _formKey.currentState.save();
      await Provider.of<Auth>(context, listen: false)
          .signupWithEmailAndPassword(_emailAdress, _password)
          .then((value) {
        Navigator.pushReplacementNamed(context, BottomBarScreen.routeName);
      });
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
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
                      child: Column(
                        children: [
                          TextFormField(
                            key: ValueKey('name'),
                            validator: (value) =>
                                AutoValidate.alphanumericWithSpaces(value)
                                    ? null
                                    : 'enter a valid Name',
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () =>
                                FocusScope.of(context).requestFocus(_phoneFN),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              filled: false,
                              labelText: "NAME",
                            ),
                            onSaved: (newValue) => _name = newValue,
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            key: ValueKey('phoneNumber'),
                            validator: (value) => AutoValidate.phone(value)
                                ? null
                                : 'enter a valid Phone Number',
                            textInputAction: TextInputAction.next,
                            focusNode: _phoneFN,
                            onEditingComplete: () =>
                                FocusScope.of(context).requestFocus(_emailFN),
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              suffix: Container(
                                width: 18,
                                height: 20,
                                child: Image.asset("assets/images/writing.png"),
                              ),
                              border: UnderlineInputBorder(),
                              filled: false,
                              labelText: "PHONE NUMBER",
                            ),
                            onSaved: (newValue) => _phoneNumber = newValue,
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            key: ValueKey('email'),
                            validator: (value) => AutoValidate.email(value)
                                ? null
                                : 'enter a valid Email',
                            textInputAction: TextInputAction.next,
                            focusNode: _emailFN,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(_passwordFN),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              //  suffix: Container(
                              //  width: 18,
                              //height: 20,
                              //child: Image.asset("assets/images/writing.png"),
                              //),
                              border: UnderlineInputBorder(),
                              filled: false,
                              labelText: "EMAIL ADDRESS",
                            ),
                            onSaved: (newValue) => _emailAdress = newValue,
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            key: ValueKey('password'),
                            validator: (value) => AutoValidate.password(value)
                                ? null
                                : 'enter a valid Password',
                            textInputAction: TextInputAction.next,
                            focusNode: _passwordFN,
                            onEditingComplete: () =>
                                FocusScope.of(context).requestFocus(_addressFN),
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                            decoration: InputDecoration(
                              suffix: Container(
                                width: 18,
                                height: 20,
                                child: Image.asset("assets/images/writing.png"),
                              ),
                              border: UnderlineInputBorder(),
                              filled: false,
                              labelText: "PASSWORD",
                            ),
                            onSaved: (newValue) => _password = newValue,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            key: ValueKey('Address'),
                            validator: (value) =>
                                AutoValidate.alphanumericWithSpaces(value)
                                    ? null
                                    : 'enter a valid Address',
                            textInputAction: TextInputAction.next,
                            focusNode: _addressFN,
                            onEditingComplete: onSubmit,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              filled: false,
                              labelText: " ADDRESS",
                            ),
                            onSaved: (newValue) => _address = newValue,
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                  value: _checkboxval,
                                  onChanged: (bool newVal) {
                                    setState(() {
                                      _checkboxval = newVal;
                                    });
                                  }),
                              Text("I have Read and agree to the "),
                              Text(
                                "Terms and conditions",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue[600]),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.09,
                          ),
                          GestureDetector(
                            onTap: onSubmit,
                            child: Container(
                              width: double.infinity - 2,
                              height: 57,
                              alignment: Alignment.center,
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.pColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
