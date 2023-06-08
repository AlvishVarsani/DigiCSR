
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/login/login_screen.dart';
import 'screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DigiCSR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => SplashScreen(),
        '/auth':(context) => Login_Screen()
      },
    );
  }
}


