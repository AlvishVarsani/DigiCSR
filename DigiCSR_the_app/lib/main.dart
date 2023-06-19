
import 'package:digicsr/portraitmodemixin.dart';
import 'package:digicsr/screens/SignUp/benificiary.dart';
import 'package:digicsr/screens/SignUp/company.dart';
import 'package:digicsr/screens/SignUp/ngo.dart';
import 'package:digicsr/screens/login/benificiarylogin.dart';
import 'package:digicsr/screens/login/companylogin.dart';
import 'package:digicsr/screens/login/ngologin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants/constants.dart';
import 'screens/login/login_screen.dart';
import 'screens/splash_screen/splash_screen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget with PortraitModeMixin {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MaterialApp(
      title: 'DigiCSR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/auth': (context) => Login_Screen(),
        '/auth/login': (context) => (user == 'Company')?CompanyLogin():(user == 'NGO')?NGOLogin():BenificiaryLogin(),
        '/auth/signup': (context) => (user == 'Company')?CompanySignUp():(user == 'NGO')?NGOSignUp():BenificiarySignUp(),
      },
    );
  }
}
