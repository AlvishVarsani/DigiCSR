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
  ButtonStyle btnstyle = ButtonStyle(
      foregroundColor: MaterialStatePropertyAll(black),
      // surfaceTintColor: MaterialStatePropertyAll(black),
      shadowColor: MaterialStatePropertyAll(Color(0x200CB6F0)),
      backgroundColor: MaterialStatePropertyAll(Color(0x200CB6F0)),
      elevation: MaterialStatePropertyAll(20),
      minimumSize: MaterialStatePropertyAll(Size(150, 50)),
      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(11),side: BorderSide(color: primary,width: 1.2,style: BorderStyle.solid))));

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
      drawer: DrawerScreen(),
      drawerEdgeDragWidth: w * 0.45,
      backgroundColor: white,
      body: SafeArea(
        child: Stack(children: [
          Container(
            height: h * 0.5,
            width: w,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [primary,white],begin: Alignment.topCenter,end: Alignment.bottomCenter)
            ),
          ),
          Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: h * 0.5,
                  child: Center(
                    child: Card(
                      // margin: EdgeInsets.only(top: 100, bottom: 20),
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Container(
                        // height: h * 0.3,
                        width: w * 0.7,
                        padding: EdgeInsets.all(14),
                        child: Image.asset(
                          'assets/images/DigiCSR_Logo_Black_Tagline-1.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  // width: 500,
                  padding: EdgeInsets.only(right: 70, left: 70),
                  // alignment: Alignment(0.5, 0.5),
                  child: Column(
                    children: [
                      Text(
                        'Welcome to DigiCSR',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: black,
                            fontSize: 25,
                            letterSpacing: 1.6,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Join our community in order to get service or to give service.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: black,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      // border: Border.all(color: Colors.black12,style: BorderStyle.solid),
                      // borderRadius: BorderRadius.circular(30)
                      ),
                  // padding: const EdgeInsets.all(20.0),
                  height: 200,
                  padding: EdgeInsets.all(10),
                  // width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: Container()),
                      ElevatedButton(
                        onPressed: () => {
                          auth = 'login',
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserSelection()))
                        },
                        onHover: (value) => {},
                        child: Text('Login',style: TextStyle(fontSize: 20),),
                        style: btnstyle,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                        onPressed: () => {
                          auth = 'signup',
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserSelection())),
                        },
                        child: Text('Sign Up',style: TextStyle(fontSize: 20),),
                        style: btnstyle,
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                ),
              ]),
        ]),
      ),
    );
  }
}
