import 'package:digi_csr/views/btn_to_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'btn_to_signup.dart';

class FirstLoginSignupPageButton extends StatefulWidget {
  const FirstLoginSignupPageButton({super.key});

  @override
  State<FirstLoginSignupPageButton> createState() =>
      _FirstLoginSignupPageButtonState();
}

class _FirstLoginSignupPageButtonState
    extends State<FirstLoginSignupPageButton> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // DecoratedBox(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/backgroundimage.jpg"),))),

            // SizedBox(
            //   height: ,
            // ),
            Center(
              child: Container(
                  height: 130,
                  width: 325,
                  child: Image.asset("assets/images/appLogo.jpg",
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 20,
            ),

            Text(
              'Welcome ',
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Always with you',
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 233, 90, 80),
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: 250,
                height:45,
                child: ElevatedButton(
                  style:ElevatedButton.styleFrom(shadowColor: Colors.black,elevation: 20,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                  
                  onPressed: () {
                    Get.to(()=> ButtonToLoginAs());


                  }, child: Text("  Login to DigiCSR",style: TextStyle(fontSize: 18),),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                width: 250,
                height: 45,
                
                child: ElevatedButton(
                   style:ElevatedButton.styleFrom(backgroundColor: Colors.white,shadowColor: Colors.black,elevation: 20,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                  
                  onPressed: () { Get.to(()=> ButtonToSignup());}, child: Text("Signup to DigiCSR",style: TextStyle(fontSize: 18,color: Colors.blue)))),
            )
          ],
        ),
      ),
    );
  }
}
