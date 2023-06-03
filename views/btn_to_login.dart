import 'package:digi_csr/consts/colors.dart';
import 'package:digi_csr/screen/login_screen_for_company.dart';
import 'package:digi_csr/screen/login_screen_for_ngo.dart';
import 'package:digi_csr/views/btn_to_signup.dart';
import 'package:digi_csr/views/common_widgets/elevated_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

import '../screen/login_screen_for_users.dart';
import '../screen/signup_screen for_company.dart';

class ButtonToLoginAs extends StatefulWidget {
  const ButtonToLoginAs({super.key});

  @override
  State<ButtonToLoginAs> createState() => _ButtonToLoginAsState();
}

class _ButtonToLoginAsState extends State<ButtonToLoginAs> {
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
                    Get.to(() => LoginScreenForCompany());
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  title: 'Login as Company',
                  icons: FaIcon(
                    FontAwesomeIcons.building,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ourButton(
                  onPress: () {
                    Get.to(() => LoginScreenForUsers());
                  },
                  color: Colors.blue, //37 211 102
                  textColor: Colors.white,
                  title: 'Login as Users',

                  icons: FaIcon(
                    FontAwesomeIcons.user,
                    color: Colors.white,
                    size: 23,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ourButton(
                  onPress: () {
                    Get.to(() => LoginScreenForNGO());
                  },
                  color: Colors.blue,
                  textColor: whiteColor,
                  title: 'Login as Ngo',
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
