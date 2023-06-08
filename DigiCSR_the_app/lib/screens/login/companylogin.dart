import 'dart:convert';

import 'package:digicsr/screens/Homescreen/homescreen.dart';
import 'package:digicsr/screens/company/company_profile.dart';
import 'package:digicsr/screens/company/rfp.dart';
import 'package:digicsr/screens/login/login_screen.dart';
import 'package:digicsr/users/ngouser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../constants/constants.dart';
import '../../users/companyuser.dart';

class CompanyLogin extends StatefulWidget {
  @override
  State<CompanyLogin> createState() {
    return _CompanyLogin();
  }
}

class _CompanyLogin extends State<CompanyLogin> {
  final _formkey = GlobalKey<FormState>();

  OtpFieldController otpcontroller = OtpFieldController();
  String otp = '';
  bool otpverify = false;

  CompanyUser company = CompanyUser();

  bool otpsent = false;

  // TextButton btn = TextButton(onPressed: (){}, child: );


  void sendOTP() async {
    // final dio = Dio();
    try {
      // var resSend = await dio.post('http://192.168.114.94:4000/company/login',
      //   data: {
      //     'email': company.company_email
      //   },
      //   options: Options(
      //     headers: {}
      //   )
      // );
      // var resSend = await http.post(Uri.parse('http://192.168.114.94:4000/company/login'),
      var resSend = await http.post(Uri.parse('http://localhost:4000/company/login'),
          headers: <String, String>{
            'Context-Type': 'application/json;charSet=UTF-8'
          },
          body: {
            'email': company.company_email
          });
          otpsent = true;
          print(resSend.body);
    } catch (e) {
      print(e);
    }
  }

  void verifyOTP() async{
    try {
      //  res = await http.post(Uri.parse('http://192.168.114.94:4000/company/login/verify'),
       var ress = await http.post(Uri.parse('http://localhost:4000/company/login/verify'),
          headers: <String, String>{
            'Context-Type': 'application/json;charSet=UTF-8'
          },
          body: {
            'email': company.company_email,
            'otp': otp
          });
          print(ress.body);
          print('Verified');
          print(jsonDecode(ress.body)['result']);
         await storage.write(key: company.company_email!, value: jsonDecode(ress.body)['result']);
         print('Finished');
      otpverify = true;
      btn = 'Sign in';
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
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: h,
            width: w,
            color: Colors.white,
          ),
          Column(
            children: [
              Expanded(child: Container()),
              Card(clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(0),
                color: darkgrey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                elevation: 30,
                child: Container(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                      color: darkgrey,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(child: Container()),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  side: BorderSide(
                      width: 1.5,
                      style: BorderStyle.solid,
                      strokeAlign: 3,
                      color: Colors.transparent),
                ),
                elevation: 40,
                child: Container(
                  height: h * 0.60,
                  width: w * 0.9,
                  child: Column(
                    children: [
                      Container(
                        // padding: const EdgeInsets.all(15.0),
                        padding: EdgeInsets.only(top: h * 0.012),
                        child: Text(
                          'Sign in as $user',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 28,
                            color: darkgrey,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: h * 0.035),
                        child: Row(
                          children: [
                            Expanded(child: Container()),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              // margin: EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.04,top: MediaQuery.sizeOf(context).width * 0.04),
                              // padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top * 0.5,left: MediaQuery.paddingOf(context).left * 0.4),
                              child: Column(
                                children: [
                                  Container(
                                      margin: EdgeInsets.fromLTRB(5,8,5,5),
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
                                    style: TextStyle(fontFamily: 'Montserrat'),
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
                                      contentPadding: EdgeInsets.only(top: 15,bottom: 15,left: 10),
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
                            Expanded(child: Container()),
                          ],
                        ),
                      ),
                      
                      Container(
                        padding: EdgeInsets.only(top: h * 0.04,bottom: h * 0.04),
                        child: OTPTextField(
                          width: MediaQuery.of(context).size.width * 0.8,
                          controller: otpcontroller,
                          length: 6,
                          contentPadding: EdgeInsets.all(8.0),
                          onChanged: (value) => {otp = value},
                          onCompleted: (value) => {
                            otp = value,
                            verifyOTP(),
                            setState((){})},
                          // spaceBetween: 2,
                          outlineBorderRadius: 6,
                          style: TextStyle(fontFamily: 'Montserrat',fontSize: 20),
                          spaceBetween: 10, fieldWidth: 35,
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
                        padding: EdgeInsets.only(left: w * 0.04,top: h * 0.02),
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
                          margin: EdgeInsets.only(bottom: 10),
                          alignment: Alignment.center,
                          child: TextButton(
                              style: ButtonStyle(
                                  elevation: MaterialStatePropertyAll(20),
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.all(h * 0.03)),
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
                                user = 'Company';
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreenForCompany()));
                                }
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
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
              Expanded(child: Container()),
            ],
          ),
        ],
      ),
    );
  }
}
