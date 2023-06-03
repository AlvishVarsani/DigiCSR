import 'package:digicsr/screens/login/login_screen.dart';
import 'package:digicsr/users/companyuser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';


import '../../constants/constants.dart';

class CompanySignUp extends StatefulWidget {
  @override
  State<CompanySignUp> createState() {
    return _CompanySignUp();
  }
}

class _CompanySignUp extends State<CompanySignUp> {
  final _formkey = GlobalKey<FormState>();

  OtpFieldController otpcontroller = OtpFieldController();
  String otp = '';
  bool otpverify = false;

  CompanyUser company = CompanyUser();

  bool otpsent = false;

  // TextButton btn = TextButton(onPressed: (){}, child: );

  void save() async {
    try {
      var res = await http.post(Uri.parse('http://localhost:4000/company/signup'),
          headers: <String, String>{
            'Context-Type': 'application/json;charSet=UTF-8'
          },
          body: {
            'cin': company.cin,
            'email': company.company_email
          });
      otpsent = true;
    } on Exception catch (e) {
      print(e);
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Login_Screen()));
  }

  void sendOTP() async {
    try {
      var res = await http.post(Uri.parse('http://localhost:4000/company/signup'),
          headers: <String, String>{
            'Context-Type': 'application/json;charSet=UTF-8'
          },
          body: {
            'cin': company.cin,
            'email': company.company_email
          });
          print(res.body);
      otpverify = true;
    } catch (e) {
      print(e);
    }
  }

  void verifyOTP() {
    try {
      var res = http.post(Uri.parse('http://localhost:4000/company/verify'),
          headers: <String, String>{
            'Context-Type': 'application/json;charSet=UTF-8'
          },
          body: {
            'cin': company.cin,
            'email': company.company_email,
            'otp': otp
          });
      otpverify = true;
      btn = 'SignUP';
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
          Column(
            children: [
              Expanded(child: Container()),
              Card(
                margin: EdgeInsets.all(0),
                color: darkgrey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                elevation: 30,
                child: Container(
                  width: double.maxFinite,
                  height: 300,
                  decoration: BoxDecoration(
                      color: darkgrey,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                ),
              ),
            ],
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.09,
            top: (otpsent)
                ? MediaQuery.of(context).size.width * 0.18
                : MediaQuery.of(context).size.width * 0.14,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                side: BorderSide(
                    width: 1.5,
                    style: BorderStyle.solid,
                    strokeAlign: 3,
                    color: Colors.transparent),
              ),
              elevation: 30,
              child: Container(
                height: (otpsent) ? 450 : 500,
                width: 400,
                child: Column(
                  children: [
                    Container(
                      // padding: const EdgeInsets.all(15.0),
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        'SignUp as $user',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 28,
                          color: darkgrey,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 8, bottom: 5, left: 8, right: 8),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.all(5),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Email',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 20,
                                    color: darkgrey),
                              )),
                          TextFormField(
                            controller: TextEditingController(text: company.company_email),
                            onChanged: (value) {
                              company.company_email = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter email';
                              } else if (RegExp(
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(value)) {
                                return null;
                              } else {
                                return 'Enter valid email';
                              }
                            },
                            decoration: InputDecoration(
                              // label: Text(
                              //   'Email',
                              //   style: TextStyle(
                              //       color: darkgrey,
                              //       fontFamily: 'Montserrat',
                              //       fontWeight: FontWeight.w800),
                              // ),
                              hintText: 'ex. digicsr@gmail.com',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: grey)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.red)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 8, right: 8, top: 5, bottom: 5),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.all(5),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'CIN',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 20,
                                    color: darkgrey),
                              )),
                          TextFormField(
                            controller: TextEditingController(text: company.cin),
                            onChanged: (value) {
                              company.cin = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter CIN';
                              } else {
                                return 'Invalid CIN';
                              }
                            },
                            decoration: InputDecoration(
                              // label: Text(
                              //   'CSR',
                              //   style: TextStyle(
                              //       color: darkgrey,
                              //       fontFamily: 'Montserrat',
                              //       fontWeight: FontWeight.w800),
                              // ),
                              hintText: 'Enter CIN here',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: grey)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.red)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: OTPTextField(
                        width: 400,
                        controller: otpcontroller,
                        length: 6,
                        contentPadding: EdgeInsets.all(10.0),
                        onChanged: (value) => {otp = value},
                        onCompleted: (value) => {setState(verifyOTP)},
                        // spaceBetween: 2,
                        outlineBorderRadius: 6,
                        spaceBetween: 15, fieldWidth: 40,
                        textFieldAlignment: MainAxisAlignment.center,
                        fieldStyle: FieldStyle.box,
                        otpFieldStyle: OtpFieldStyle(
                            borderColor: Colors.blue,
                            focusBorderColor: Colors.blue,
                            errorBorderColor: Colors.red,
                            enabledBorderColor: Colors.blue),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 12, top: 5),
                      child: Row(
                        children: [
                          Checkbox(
                            value: otpverify, onChanged: (value) {},
                            activeColor: grey,
                            fillColor: MaterialStatePropertyAll(grey),
                            checkColor: darkgrey,
                            // focusColor: grey,
                            // hoverColor: grey,
                            // splashRadius: 9,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.transparent,
                                  style: BorderStyle.solid),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2)),
                            ),
                            // splashRadius: 12,
                          ),
                          Text(
                            'OTP verified',
                            style: TextStyle(
                                color: darkgrey,
                                fontFamily: 'Montserrat',
                                fontSize: 17),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // margin: EdgeInsets.only(top: 30),
                        alignment: Alignment.center,
                        child: TextButton(
                            style: ButtonStyle(
                                elevation: MaterialStatePropertyAll(20),
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.all(15)),
                                backgroundColor:
                                    MaterialStatePropertyAll(darkgrey),
                                shape: MaterialStatePropertyAll<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.transparent,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))))),
                            onPressed: () {
                              // (btn == 'Send OTP')
                              //     ? sendOTP()
                              //     : Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) =>
                              //                 Login_Screen()));

                              if(!otpverify){
                                sendOTP();
                              }else{
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Container()));
                              }
                            },
                            child: Text(
                              btn,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    )
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
