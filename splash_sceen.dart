


  
 
//   @override
//   void initState() {
//     //changeScreen();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: redColor,
//       body: Center(
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.topLeft,
//               child: Image.asset(icSplashBg,width: 300),
              

//             ),
//             20.heightBox,
//             applogoWidget(),
//             10.heightBox,
//             appname.text.fontFamily(bold).size(22).white.make(),
//             5.heightBox,
//             '1.0.0'.text.white.make(),
//             Spacer(),
//             credits.text.white.fontFamily(bold).make(),
//             30.heightBox,
//             // splash screen  ui completed
//           ],
//         )),
//     );
//   }
// }

import 'package:digi_csr/screen/login_screen_for_company.dart';
import 'package:digi_csr/views/btn_to_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // creating the method to change the screen
  // changeScreen()
  // {
  //   Future.delayed(Duration(seconds: 3), (){
  //     auth.authStateChanges().listen((User? user) {
  //       if (user == null && mounted) {
  //         Get.to(() => LoginScreen());
  //       }else{

  //         Get.to(() => Home());
  //       }
  //     });
  //   } );
    
  // }
  changeScreen(){
    Future.delayed(Duration(seconds: 2),(){
      Get.to(()=>ButtonToLoginAs());
     
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
    backgroundColor: Color.fromARGB(255, 160, 229, 162),
      body:
      Center(child: CircleAvatar(backgroundImage: AssetImage('assets/images/appLogo.png'),
      radius: 150,
      ))




    );
  }
}