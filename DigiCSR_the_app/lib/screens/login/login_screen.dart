import 'package:flutter/material.dart';

class Login_Screen extends StatefulWidget {
  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Card(
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
              ),
              child: Container(
                height: 300,
                width: 300,
                child: Image.asset('assets/images/DigiCSR_Logo_Black-1.png',fit: BoxFit.contain,),
              ),
            ),
            Card(
              margin: EdgeInsets.only(bottom: 80),
              elevation: 15,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))),
              child: Container(
                decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black12,style: BorderStyle.solid),
                    // borderRadius: BorderRadius.circular(30)
                    ),
                // padding: const EdgeInsets.all(20.0),
                height: 200,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => {},
                      child: Text('Login'),
                      style: ButtonStyle(
                        elevation: MaterialStatePropertyAll(20),
                          minimumSize: MaterialStatePropertyAll(Size(200, 50)),
                          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)))
                          ),
                    ),
                    ElevatedButton(
                      onPressed: () => {},
                      child: Text('Sign Up'),
                      style: ButtonStyle(
                        elevation: MaterialStatePropertyAll(20),
                          minimumSize: MaterialStatePropertyAll(Size(200, 50)),
                          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)))
                          ),
                    ),
                  ],
                ),
              ),
            ),
            // Card()
            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text('Company'),
            //   style: ButtonStyle(
            //     textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 20,color: Colors.blueAccent)),
            //     elevation: MaterialStatePropertyAll(30),
            //     minimumSize: MaterialStatePropertyAll(Size(100,50)),
            //       // backgroundColor: MaterialStatePropertyAll(Colors.black),
            //       shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            //           RoundedRectangleBorder(
            //               borderRadius:
            //                   BorderRadius.all(Radius.circular(10))))),
            // ),
            // ElevatedButton(onPressed: () {}, child: const Text('NGO')),
            // ElevatedButton(onPressed: () {}, child: const Text('Benificiary')),
          ]),
        ),
      ),
    );
  }
}
