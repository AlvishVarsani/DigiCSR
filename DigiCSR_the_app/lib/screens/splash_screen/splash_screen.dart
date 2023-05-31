import 'package:digicsr/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    Future.delayed(Duration(seconds: 70), () {
      // Get.to(()=>ButtonToLoginAs());
      Navigator.pushNamed(context, '/auth');
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor:  Color.fromRGBO(38, 191, 104, 1),
        // backgroundColor: Color.fromARGB(255, 160, 229, 162),
        body: Center(
            child: AnimatedSplashScreen(
              // backgroundColor: ,
      nextScreen: Login_Screen(),
      splash: Card(
        elevation: 60,
        shadowColor: Colors.black87,
        color: Colors.transparent,
        child: Image.asset(
          'app_icon/digicsr_app_icon.png',
          fit: BoxFit.contain,
        ),
      ),
      splashIconSize: 150,
      backgroundColor: Color(0xFF1DA1F2), //blue
      // backgroundColor: Color(0xFFE1E8ED),  //greyish white
      // backgroundColor: Color(0xFFAAB8C2), //grey
      
      animationDuration: Duration(milliseconds: 1800),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRight,
      duration: 2600,
    )));
  }
}
