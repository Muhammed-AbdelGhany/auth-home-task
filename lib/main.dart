import 'package:auth_ecommerce_task/theme/colors.dart';
import 'package:auth_ecommerce_task/views/auth/login.dart';
import 'package:auth_ecommerce_task/views/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.pColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
      routes: {
        HomeScreen.routeName: (cxt) => HomeScreen(),
      },
    );
  }
}
