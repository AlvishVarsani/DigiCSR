import 'dart:convert';

import 'package:digicsr/screens/Homescreen/homescreen.dart';
import 'package:digicsr/users/ngouser.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../constants/constants.dart';

class NGOLogin extends StatefulWidget {
  @override
  State<NGOLogin> createState() {
    return _NGOLogin();
  }
}

class _NGOLogin extends State<NGOLogin> {
  final _formkey = GlobalKey<FormState>();

  OtpFieldController otpcontroller = OtpFieldController();
  String otp = '';
  bool otpverify = false;

  NGOuser ngo = NGOuser();

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
      // var resSend = await http.post(Uri.parse('http://localhost:4000/company/login'),

      // var resSend = await http.post(Uri.parse('http://192.168.101.58:4000/company/login'),
      var resSend = await http.post(Uri.parse(ipInfo + '/NGO/login'),
          headers: <String, String>{
            'Context-Type': 'application/json;charSet=UTF-8'
          },
          body: {
            'email': ngo.email
          });
      otpsent = true;
      print(resSend.body);
    } catch (e) {
      print(e);
    }
  }

  void verifyOTP() async {
    try {
      var ress = await http.post(Uri.parse(ipInfo + '/NGO/login/verify'),
          headers: <String, String>{
            'Context-Type': 'application/json;charSet=UTF-8'
          },
          body: {
            'email': ngo.email,
            'otp': otp
          });
      print(ress.body);
      print('Verified');
      print(jsonDecode(ress.body)['result']);
      // await storage.deleteAll();
      otpverify = true;
      btn = 'Sign in';
      debugPrint(jsonDecode(ress.body)['result']);
      await storage.write(key: "ngo", value: jsonDecode(ress.body)['result']);
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
    final orientation = MediaQuery.of(context).orientation;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    Future<void> _showDialog() {
      return showDialog<void>(
          context: context,
          builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    side: BorderSide(
                        style: BorderStyle.solid, color: Colors.transparent)),
                title: Text(
                  'OTP Verification',
                  style: TextStyle(fontSize: 20),
                ),
                content: Container(
                  // Use a fraction of the screen height for the container height
                  height: h * 0.3,
                  padding: EdgeInsets.only(top: 6, bottom: 6),
                  child: Column(
                    children: [
                      Text(
                          'The OTP is sent to your given email address. Check your email and verify it.'),
                      Expanded(
                        child: OTPTextField(
                          // Use a fraction of the screen width for the text field width
                          width: w * 0.8,
                          controller: otpcontroller,
                          length: 6,
                          contentPadding:
                              EdgeInsets.only(left: 8.0, right: 8.0),
                          onChanged: (value) => {otp = value},
                          onCompleted: (value) =>
                              {otp = value, verifyOTP(), setState(() {})},
                          // spaceBetween: 2,
                          outlineBorderRadius: 6,
                          style:
                              TextStyle(fontFamily: 'Montserrat', fontSize: 20),
                          // fieldWidth: 35,
                          textFieldAlignment: MainAxisAlignment.spaceEvenly,
                          fieldStyle: FieldStyle.box,
                          otpFieldStyle: OtpFieldStyle(
                            borderColor: primary,
                            focusBorderColor: primary,
                            errorBorderColor: Colors.red,
                            enabledBorderColor: primary,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Resend',
                                style: TextStyle(fontSize: 18, color: black),
                              ),
                              style: ButtonStyle(
                                  // backgroundColor:
                                  //     MaterialStateProperty.all(primary),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: primary,
                                              style: BorderStyle.solid),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)))),
                                  // Use a fraction of the screen width for the button size
                                  minimumSize: MaterialStateProperty.all(
                                      Size(w * 0.3, 20))),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Verify',
                                style: TextStyle(fontSize: 18, color: black),
                              ),
                              style: ButtonStyle(
                                  // backgroundColor:
                                  //     MaterialStateProperty.all(primary),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: primary,
                                              style: BorderStyle.solid),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)))),
                                  // Use a fraction of the screen width for the button size
                                  minimumSize: MaterialStateProperty.all(
                                      Size(w * 0.3, 20))),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                insetPadding: EdgeInsets.all(20),
                // actions: [
                //   TextButton(onPressed: (){}, child: child)
                // ],
              ));
    }

    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Container(
          //   height: h,
          //   width: w,
            
          //   color: Colors.white,
          // ),
          Positioned(
              top: 0,
              child: SvgPicture.asset(
                'assets/images/background_2.svg',
                width: w,
                height: h,
              )),
          // Column(
          //   children: [
          //     Expanded(child: Container()),
          //     Card(
          //       clipBehavior: Clip.antiAlias,
          //       margin: EdgeInsets.all(0),
          //       color: primary,
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.only(
          //               topLeft: Radius.circular(50),
          //               topRight: Radius.circular(50))),
          //       elevation: 30,
          //       child: Container(
          //         width: double.maxFinite,
          //         height: MediaQuery.of(context).size.height * 0.45,
          //         decoration: BoxDecoration(
          //             color: primary,
          //             borderRadius: BorderRadius.only(
          //                 topLeft: Radius.circular(50),
          //                 topRight: Radius.circular(50))),
          //       ),
          //     ),
          //   ],
          // ),
          Column(
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
                  height: h * 0.40,
                  width: w * 0.9,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Login as $user',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 32,
                            color: primary,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
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
                                      margin: EdgeInsets.fromLTRB(5, 8, 5, 5),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Email',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 20,
                                            color: primary),
                                      )),
                                  TextFormField(
                                    controller:
                                        TextEditingController(text: ngo.email),
                                    onChanged: (value) {
                                      ngo.email = value;
                                    },
                                    style: TextStyle(fontFamily: 'Montserrat',fontSize: 18,color: primary),
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
                                      contentPadding: EdgeInsets.only(
                                          top: 15, bottom: 15, left: 10),
                                      // label: Text(
                                      //   'Email',
                                      //   style: TextStyle(
                                      //       color: primary,
                                      //       fontFamily: 'Montserrat',
                                      //       fontWeight: FontWeight.w800),
                                      // ),
                                      hintText: 'ex. digicsr@gmail.com',hintStyle: TextStyle(color: primary),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(color: primary)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(color: primary)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                      ),
                      SizedBox.shrink(
                        child: Container(height: 20,),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: w * 0.04, top: h * 0.015),
                        child: Row(
                          children: [
                            Checkbox(
                              value: otpverify, onChanged: (value) {},
                              activeColor: primary,
                              fillColor: MaterialStatePropertyAll(primary),
                              checkColor: primary,
                              focusColor: primary,
                              // hoverColor: primary,
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
                                  color: primary,
                                  fontFamily: 'Montserrat',
                                  fontSize: 17),
                            )
                          ],
                        ),
                      ),
                      // Expanded(child: Container()),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.center,
                        child: TextButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStatePropertyAll(Colors.transparent),
                                // minimumSize:
                                //     MaterialStatePropertyAll(Size(100, 50)),
                                maximumSize: MaterialStatePropertyAll(Size(
                                    (144 < w * 0.4) ? 144 : w * 0.4, 60)),
                                elevation: MaterialStatePropertyAll(20),
                                padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                                // backgroundColor:
                                //     MaterialStatePropertyAll(primary),
                                shape: MaterialStatePropertyAll<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: primary,
                                            style: BorderStyle.solid,
                                            width: 1.5
                                            ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))))),
                            onPressed: () {
                              user = 'NGO';
                              if (!otpverify) {
                                sendOTP();
                                _showDialog();
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              }
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                            },
                            child: Text(
                              btn,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: primary,
                                  
                                  ),
                            )),
                      ),
                      Expanded(child: Container()),
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
