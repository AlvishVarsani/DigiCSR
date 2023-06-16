import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/screens/login/user.dart';
import 'package:flutter/material.dart';

import '../Homescreen/drawer.dart';

class Login_Screen extends StatefulWidget {
  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  // Color btnclr = Color(0x720CB6F0);

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      body: Container(
        color: Color(0x130CB6F0),
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: h * 0.1,
                width: w,
              ),
              Center(
                child: Card(
                  // margin: EdgeInsets.only(top: 100, bottom: 20),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: h * 0.27,
                    width: w ,
                    padding: EdgeInsets.all(14),
                    child: Image.asset(
                      'assets/images/DigiCSR_Logo_Black_Tagline-1.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),

              SizedBox(height: (40<h*0.05)?40:h*0.05,),

              Expanded(
                child: Container(
                  // height: h*0.2,
                  padding: EdgeInsets.all((30 < w * 0.08)?30:w*0.08),
                  // alignment: Alignment(0.5, 0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: (16 > h*0.02 ? 16 : h*0.02)),
                        child: Text(
                      'Let\'s be helpful !!',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                          color: black,
                          fontSize: 40,
                          // letterSpacing: 1.3,
                          fontWeight: FontWeight.bold,
                         ),
                        ),
                      ),
                      Text(
                        'A digital platform that connects companies and NGOs to collaborate and make a meanigful impact on society',
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                      color: black,
                      fontSize: 16,
                      letterSpacing: 1.1
                        ),
                      ),
                      SizedBox(height: (40<h*0.05)?40:h*0.05,),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () => {
                                auth = 'login',
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UserSelection()))
                              },
                              onHover: (value) => {},
                              child: Container(
                                  margin: EdgeInsets.only(right: 8),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(fontSize: 23, color: white),
                                  )),
                              style: ButtonStyle(
                                  padding: MaterialStatePropertyAll(EdgeInsets.only(top: 8,bottom: 8,right: 10,left: 10)),
                                  elevation: MaterialStatePropertyAll(15),
                                  minimumSize: MaterialStatePropertyAll(Size(w*0.35, 50)),
                                  maximumSize:
                                      MaterialStatePropertyAll(Size(w * 0.43, 60)),
                                  shape:
                                      MaterialStatePropertyAll<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(15)),
                                              side: BorderSide(
                                                  color: primary,
                                                  width: 1.2,
                                                  style: BorderStyle.solid)))),
                            ),
                            Expanded(child: Container()),
                            ElevatedButton(
                              onPressed: () => {
                                auth = 'signup',
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UserSelection()))
                              },
                              onHover: (value) => {},
                              child: Container(
                                  margin: EdgeInsets.only(right: 8),
                                  child: Text(
                                    'SignUp',
                                    style: TextStyle(fontSize: 23, color: white),
                                  )),
                              style: ButtonStyle(
                                  // padding: MaterialStatePropertyAll(EdgeInsets.only(top: 8,bottom: 8,right: 10,left: 10)),
                                  elevation: MaterialStatePropertyAll(15),
                                  minimumSize: MaterialStatePropertyAll(Size(w*0.35, 50)),
                                  maximumSize:
                                      MaterialStatePropertyAll(Size(w * 0.43, 60)),
                                  shape:
                                      MaterialStatePropertyAll<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(15)),
                                              side: BorderSide(
                                                  color: primary,
                                                  width: 1.2,
                                                  style: BorderStyle.solid)))),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
