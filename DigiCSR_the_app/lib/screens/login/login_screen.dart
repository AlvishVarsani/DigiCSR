import 'package:digicsr/constants/constants.dart';
<<<<<<< HEAD
import 'package:digicsr/screens/company/company_profile.dart';
=======

>>>>>>> refs/remotes/origin/main
import 'package:digicsr/screens/login/user.dart';
import 'package:flutter/material.dart';



class Login_Screen extends StatefulWidget {
  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  Color btnclr = Color(0xFF14171A);
  ButtonStyle btnstyle = ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xFF14171A)),
                          elevation: MaterialStatePropertyAll(20),
                          minimumSize: MaterialStatePropertyAll(Size(150, 50)),
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(11))));

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Scaffold(
        backgroundColor: Color(0xFFAAB8C2),
        body: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Center(
                  child: Card(
                    // margin: EdgeInsets.only(top: 100, bottom: 20),
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Container(
                      height: 170,
                      width: 280,
                      padding: EdgeInsets.all(20),
                      child: Image.asset(
                        'assets/images/DigiCSR_Logo_Black-1.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            
              Container(
                // width: 500,
                padding: EdgeInsets.only(right: 70,left: 70),
                // alignment: Alignment(0.5, 0.5),
                child: Column(
                  children: [
                    Text(
                      'Welcome to DigiCSR',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: btnclr,
                          fontSize: 25,
                          letterSpacing: 1.6,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Join our community in order to get service or to give service.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: btnclr,
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UserSelection()))
                      },
                      onHover:(value) => {
                        
                      },
                      child: Text('Login'),
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
                      child: Text('Sign Up'),
                      style: btnstyle,
                    ),
                    Expanded(child: Container())
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
