import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/screens/SignUp/benificiary.dart';
import 'package:digicsr/screens/SignUp/company.dart';
import 'package:digicsr/screens/SignUp/ngo.dart';


import 'package:flutter/material.dart';

class UserSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(0),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Card(
            margin: EdgeInsets.all(0),
            color: darkgrey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            elevation: 30,
            child: Container(
              width: double.maxFinite,
              height: 300,
              decoration: BoxDecoration(
                  color: darkgrey,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*0.05,
            left: MediaQuery.of(context).size.width*0.31,
            child: Card(
              // margin: EdgeInsets.only(top: 100, bottom: 20),
              elevation: 15,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Container(
                alignment: Alignment.center,
                height: 90,
                width: 180,
                padding: EdgeInsets.all(20),
                child: Image.asset(
                  'assets/images/DigiCSR_Logo_Black-1.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*0.2,
            left: MediaQuery.of(context).size.width*0.22,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Text(
                'Want to SignUp as ...',
                style: TextStyle(color: black, fontSize: 30, fontFamily: 'Lato'),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*0.35,
            left: MediaQuery.of(context).size.width * 0.2,
            child: Card(
              elevation: 25,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Container(
                decoration: BoxDecoration(
                    color: grey,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: 300,
                height: 220,
                padding: EdgeInsets.all(12),

                // margin: EdgeInsets.only(top: 150,),
                alignment: Alignment(0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        user = 'Company';
                        Navigator.push(context, MaterialPageRoute(builder: (conetx)=>CompanySignUp()));
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                child: Icon(
                                  Icons.business_sharp,
                                  color: black,
                                )),
                            Expanded(
                              child: Container(
                                alignment: Alignment(0, 0),
                                margin: EdgeInsets.only(right: 30, left: 10),
                                child: Text(
                                  'Company',
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Lato'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      style: ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(Size(200, 40)),
                          maximumSize: MaterialStatePropertyAll(Size(250, 50)),
                          padding: MaterialStatePropertyAll(EdgeInsets.only(
                              top: 15, bottom: 15, right: 6, left: 6)),
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: darkgrey,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))))),
                    ),
                    TextButton(
                      onPressed: () {
                        user = 'NGO';
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NGOSignUp()));
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                child: Icon(
                                  Icons.handshake_outlined,
                                  color: black,
                                )),
                            Expanded(
                              child: Container(
                                alignment: Alignment(0, 0),
                                margin: EdgeInsets.only(right: 30, left: 10),
                                child: Text(
                                  'NGO',
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Lato'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      style: ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(Size(200, 40)),
                          maximumSize: MaterialStatePropertyAll(Size(250, 50)),
                          padding: MaterialStatePropertyAll(EdgeInsets.only(
                              top: 15, bottom: 15, right: 6, left: 6)),
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: darkgrey,
                                          style: BorderStyle.solid),
                                      ))),
                    ),
                    TextButton(
                      onPressed: () {
                        user = 'Benificiary';
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BenificiarySignUp()));
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                child: Icon(
                                  Icons.person,
                                  color: black,
                                )),
                            Expanded(
                              child: Container(
                                alignment: Alignment(0, 0),
                                margin: EdgeInsets.only(right: 30, left: 10),
                                child: Text(
                                  'Benificiary',
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Lato'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      style: ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(Size(200, 40)),
                          maximumSize: MaterialStatePropertyAll(Size(250, 50)),
                          padding: MaterialStatePropertyAll(EdgeInsets.only(
                              top: 15, bottom: 15, right: 6, left: 6)),
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: darkgrey,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
