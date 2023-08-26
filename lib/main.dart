import 'package:flutter/material.dart';
import 'package:quiz_app/screens/forget_password.dart';
import 'package:quiz_app/screens/homePage.dart';
import 'package:quiz_app/screens/logIn.dart';
import 'package:quiz_app/screens/signUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        routes: {
          SignUp.id : (context) => SignUp(),
          LogIn.id : (context) => LogIn(),
          ForgetPassword.id : (context) => ForgetPassword(),
          HomePage.id : (context) => HomePage(),
        },
      home: HomePage(),
      theme: ThemeData(
        useMaterial3: true
      ),
    );
  }
}
