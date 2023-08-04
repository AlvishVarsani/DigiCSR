import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/screens/Homescreen/HomeScreenForBenifi.dart';
import 'package:digicsr/screens/Homescreen/mainscreen.dart';
import 'package:digicsr/screens/SignUp/benificiary.dart';
import 'package:digicsr/screens/SignUp/company.dart';
import 'package:digicsr/screens/SignUp/ngo.dart';
import 'package:flutter/material.dart';

import '../../constants/DataLoaders.dart';
import 'UserLogin.dart';


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
          Column(
            children: [
              Expanded(child: Center(
                child: Card(
                        // margin: EdgeInsets.only(top: 100, bottom: 20),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          alignment: Alignment.center,
                          height: h * 0.2,
                          width: w * 0.65,
                          padding: EdgeInsets.only(top: h * 0.02,bottom: h * 0.02),
                          child: Image.asset(
                            'assets/images/DigiCSR_Logo_Black-1.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
              ),),
              Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(0),
                color: primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                elevation: 30,
                child: Container(
                  width: double.maxFinite,
                  height: h * 0.6,
                  decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                ),
              ),
            ],
          ),
          
          Positioned(
            top: h*0.43,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: h * 0.04),
              child: Row(
            children: [
              Expanded(child: Container()),
              Container(
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
          ),
          Positioned(
            top: h*0.5,
            child: Container(
              width: w,
              padding: EdgeInsets.only(top: h * 0.05 ),
              child: Row(
            children: [
              Expanded(child: Container()),
              Container(
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.all(w * 0.05),
                alignment: Alignment(0, 0),
                child: 
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () async{
                        index = 0;
                        user = 'Company';
                        final token = await Token();
                          if (auth == 'signup') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CompanySignUp()));
                        } else if((token == null) && auth == 'login'){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserLogin()));
                        }
                        else{
                          await loadCompanyData();
                          await loadHomeScreen();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
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
                        backgroundColor: MaterialStatePropertyAll(Color(0x85FFFFFF)),
                          padding: MaterialStatePropertyAll(EdgeInsets.only(
                              top: h * 0.02, bottom: h * 0.02, right: w * 0.05, left: w * 0.05)),
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: black,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10))))),
                    ),
                    SizedBox(width: w,height: 5,),
                    TextButton(
                      onPressed: () async{
                        index = 0;
                        user = 'NGO';
                        final token = await Token();
                          if (auth == 'signup') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NGOSignUp()));
                        } else if((token == null) && auth == 'login'){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserLogin()));
                        }
                        else{
                          print(token);
                          await loadHomeScreen();
                          await loadNGOData();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
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
                          backgroundColor: MaterialStatePropertyAll(Color(0x85FFFFFF)),
                          padding: MaterialStatePropertyAll(EdgeInsets.only(
                              top: h*0.02, bottom: h*0.02, right: w*0.05, left: w*0.05)),
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            side: BorderSide(
                                color: black, style: BorderStyle.solid),
                          ))),
                    ),
                    SizedBox(height: 5,),
                    TextButton(
                      onPressed: () async{
                        index = 0;
                        user = 'Benificiary';
                        String? token = await Token();
                          if (auth == 'signup') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BenificiarySignUp()));
                        } else if((token == null) && auth == 'login'){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserLogin()));
                        }
                        else{
                          await loadHomeScreen();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreenForBenifi()));
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
                          backgroundColor: MaterialStatePropertyAll(Color(0x85FFFFFF)),
                          padding: MaterialStatePropertyAll(EdgeInsets.only(
                              top: h*0.02, bottom: h*0.02, right: w*0.05, left: w*0.05)),
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: black,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10))))),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
          
            ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
