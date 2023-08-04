import 'package:digicsr/constants/DataLoaders.dart';
import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../Homescreen/HomeScreenForBenifi.dart';
import '../Homescreen/mainscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void checkUser()async{
    String? token = await Token();
    print("This is token: ${token}");
      final type = await UserType();
      if(token == null){
        print("Going");
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login_Screen()));
      }else{
        if(type == 'company'){
          await loadCompanyData();
          await loadHomeScreen();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen()));
        }else if(type == 'NGO'){
          await loadHomeScreen();
          await loadNGOData();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
        }else{
          await loadHomeScreen();
          print('beni');
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreenForBenifi()));
        }
      }
  }
  void changeScreen() {
    Future.delayed(Duration(seconds: 70), () {
      // Get.to(()=>ButtonToLoginAs());
      checkUser();
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Material(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [primary, white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Center(
              child: AnimatedSplashScreen(
              // backgroundColor: ,
              nextScreen: Login_Screen(),
              splash: Card(
          elevation: 60,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          child: Image.asset(
            'assets/app_icon/digicsr_app_icon.png',
            height: w * 0.25,
            width: w * 0.25,
            fit: BoxFit.contain,
          ),
              ),
              // splashIconSize: 120,
              backgroundColor: white, //blue
              // backgroundColor: Color(0xFFE1E8ED),  //greyish white
              // backgroundColor: Color(0xFFAAB8C2), //grey
        
              animationDuration: Duration(milliseconds: 1300),
              splashTransition: SplashTransition.scaleTransition,
              pageTransitionType: PageTransitionType.leftToRight,
              duration: 2500,
            )),
        ));
  }
}
