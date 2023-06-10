import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/screens/Homescreen/homescreen.dart';
import 'package:digicsr/screens/SignUp/benificiary.dart';
import 'package:digicsr/screens/SignUp/company.dart';
import 'package:digicsr/screens/SignUp/ngo.dart';
import 'package:digicsr/screens/login/ngologin.dart';
import 'package:flutter/material.dart';

import 'benificiarylogin.dart';
import 'companylogin.dart';


class UserSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(0),
            height: h,
            width: w,
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
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: h * 0.11),
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    Card(
                      // margin: EdgeInsets.only(top: 100, bottom: 20),
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Container(
                        alignment: Alignment.center,
                        height: h * 0.14,
                        width: w * 0.50,
                        padding: EdgeInsets.only(top: h * 0.02,bottom: h * 0.02),
                        child: Image.asset(
                          'assets/images/DigiCSR_Logo_Black-1.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: h * 0.04),
            child: Row(
              children: [
                Expanded(child: Container()),
                Container(
                  // height: MediaQuery.of(context).size.height * 0.45,
                  // width: MediaQuery.of(context).size.width * 0.80,
                  // padding: EdgeInsets.only(
                  //     top: MediaQuery.of(context).size.height * 0.03,
                  //     left: MediaQuery.of(context).size.width * 0.08,
                  //     right: MediaQuery.of(context).size.width * 0.08),
                  child: Text(
                    'Want to $auth as ...',
                    style:
                        TextStyle(color: black, fontSize: 30, fontFamily: 'Lato'),
                  ),
                ),
                Expanded(child: Container())
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: h * 0.05 ),
            child: Row(
              children: [
                Expanded(child: Container()),
                Card(
                  elevation: 25,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Container(
                    decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.3,
                    padding: EdgeInsets.all(w * 0.05),
          
                    // margin: EdgeInsets.only(top: 150,),
                    alignment: Alignment(0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () async{
                            user = 'Company';
                            final token = await fetchToken();
                            if(token == null){
                              if (auth == 'signup') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CompanySignUp()));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CompanyLogin()));
                            }
                              
                            }
                            else{
                              print(token);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                            }
                            
                          },
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    // margin: EdgeInsets.only(left: w * 0.015, right: 0.015),
                                    child: Icon(
                                      Icons.business_sharp,
                                      color: black,
                                    )),
                                    
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment(0, 0),
                                    margin: EdgeInsets.only(right: w * 0.02, left: 0.01),
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
                              padding: MaterialStatePropertyAll(EdgeInsets.only(
                                  top: h * 0.02, bottom: h * 0.02, right: w * 0.05, left: w * 0.05)),
                              shape:
                                  MaterialStatePropertyAll<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: darkgrey,
                                              style: BorderStyle.solid),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10))))),
                        ),
                        TextButton(
                          onPressed: () {
                            user = 'NGO';
                            if (auth == 'signup') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NGOSignUp()));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NGOLogin()));
                            }
                          },
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    // margin: EdgeInsets.only(left: w*0.015, right: w*0.015),
                                    child: Icon(
                                      Icons.handshake_outlined,
                                      color: black,
                                    )),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment(0, 0),
                                    margin: EdgeInsets.only(right: w*0.02, left: w*0.02),
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
                              // minimumSize: MaterialStatePropertyAll(Size(200, 40)),
                              // maximumSize: MaterialStatePropertyAll(Size(250, 50)),
                              padding: MaterialStatePropertyAll(EdgeInsets.only(
                                  top: h*0.02, bottom: h*0.02, right: w*0.05, left: w*0.05)),
                              shape:
                                  MaterialStatePropertyAll<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                side: BorderSide(
                                    color: darkgrey, style: BorderStyle.solid),
                              ))),
                        ),
                        TextButton(
                          onPressed: () {
                            user = 'Benificiary';
                            if (auth == 'signup') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BenificiarySignUp()));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BenificiaryLogin()));
                            }
                          },
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    // margin: EdgeInsets.only(left: w*0.015, right: w*0.015),
                                    child: Icon(
                                      Icons.person,
                                      color: black,
                                    )),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment(0, 0),
                                    margin: EdgeInsets.only(right: w*0.02, left: w*0.02),
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
                              // minimumSize: MaterialStatePropertyAll(Size(200, 40)),
                              // maximumSize: MaterialStatePropertyAll(Size(250, 50)),
                              padding: MaterialStatePropertyAll(EdgeInsets.only(
                                  top: h*0.02, bottom: h*0.02, right: w*0.05, left: w*0.05)),
                              shape:
                                  MaterialStatePropertyAll<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: darkgrey,
                                              style: BorderStyle.solid),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10))))),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container()),

              ],
            ),
          ),
            ],
          ),
          
        ],
      ),
    );
  }
}
