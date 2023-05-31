import 'package:digi_csr/consts/colors.dart';
import 'package:digi_csr/screen/signup_screen%20for_company.dart';
import 'package:digi_csr/screen/signup_screen_for_ngo.dart';
import 'package:digi_csr/screen/signup_screen_for_users.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

import '../screen/login_screen_for_company.dart';
import '../screen/login_screen_for_ngo.dart';
import '../screen/login_screen_for_users.dart';
import 'common_widgets/elevated_button.dart';


class ButtonToSignup extends StatefulWidget {
  const ButtonToSignup({super.key});

  @override
  State<ButtonToSignup> createState() => _ButtonToSignupState();
}

class _ButtonToSignupState extends State<ButtonToSignup> {

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/images/donating.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ourButton(
                  onPress: () {
                    Get.to(() => SignupSceenForTheCompany());
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  title: 'Signup as Company',
                  icons: FaIcon(
                    FontAwesomeIcons.building,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ourButton(
                  onPress: () {
                    Get.to(() => SignupScreenForUsers());
                  },
                  color: Colors.blue, //37 211 102
                  textColor: Colors.white,
                  title: 'Signup as Users',

                  icons: FaIcon(
                    FontAwesomeIcons.user,
                    color: Colors.white,
                    size: 23,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ourButton(
                  onPress: () {
                    Get.to(() => SignupScreenForNGO());
                  },
                  color: Colors.blue,
                  textColor: whiteColor,
                  title: 'Signup as Ngo',
                  icons: Image.asset(
                    'assets/images/ngologo.png',
                    fit: BoxFit.fill,
                    color: whiteColor,
                  ).box.size(37, 23).make(),
                ),
                
              ],
            ),
            
          )),
    );
  }
}