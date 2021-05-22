import 'package:auth_ecommerce_task/views/auth/signup.dart';
import 'package:auth_ecommerce_task/views/bottom_bar.dart';
import 'package:auth_ecommerce_task/views/home.dart';
import 'package:auto_validate/auto_validate.dart';
import 'package:flutter/material.dart';
import 'package:auth_ecommerce_task/theme/colors.dart';
import 'package:auth_ecommerce_task/controllers/auth_provider.dart';

import 'package:provider/provider.dart';

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

  bool _isLoading = false;
  @override
  void dispose() {
    _passwordFN.dispose();
    super.dispose();
  }

  void onSubmit() async {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState.save();
      await Provider.of<Auth>(context, listen: false)
          .loginWithEmailAndPAssword(_emailAdress, _password)
          .then((value) {
        Navigator.pushReplacementNamed(context, BottomBarScreen.routeName);
      });
    }
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: AppColors.pColor),
                    width: double.infinity,
                    height: height * .20,
                    child: Container(
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.none,
                        width: 282,
                        height: 282,
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          TextFormField(
                            key: ValueKey('email'),
                            validator: (value) => AutoValidate.email(value)
                                ? null
                                : 'enter a valid Email',
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(_passwordFN),
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
                            validator: (value) => AutoValidate.password(value)
                                ? null
                                : 'enter a valid Password',
                            textInputAction: TextInputAction.done,
                            focusNode: _passwordFN,
                            onEditingComplete: onSubmit,
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
                            height: 58,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have an account ? '),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, SignUpScreen.routeName);
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.blue[400],
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child:
                                    Image.asset("assets/images/facebook.png"),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Container(
                                child: Image.asset("assets/images/gmail.png"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          GestureDetector(
                            onTap: onSubmit,
                            child: Container(
                              width: double.infinity - 2,
                              height: 57,
                              alignment: Alignment.center,
                              child: Text(
                                'Sign In',
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
