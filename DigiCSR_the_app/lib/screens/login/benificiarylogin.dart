import 'dart:convert';

import 'package:digicsr/screens/benificiary/benificiary_screen.dart';
import 'package:digicsr/users/benificiaryuser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../constants/constants.dart';
import '../Homescreen/mainscreen.dart';

class BenificiaryLogin extends StatefulWidget {
  @override
  State<BenificiaryLogin> createState() {
    return _BenificiaryLogin();
  }
}

class _BenificiaryLogin extends State<BenificiaryLogin> {
  final _formkey = GlobalKey<FormState>();

  OtpFieldController otpcontroller = OtpFieldController();
  String otp = '';
  bool otpverify = false;

  BenificiaryUser benificiary = BenificiaryUser();

  bool otpsent = false;

  // TextButton btn = TextButton(onPressed: (){}, child: );

  void sendOTP() async {
    try {
      var resSend = await http.post(
          Uri.parse(ipInfo + '/Beneficiary/login'),
          headers: <String, String>{
            'Context-Type': 'application/json;charSet=UTF-8'
          },
          body: {
            'email': benificiary.benificiary_email,
          });
      print(resSend.body);
      otpverify = true;
    } catch (e) {
      print(e);
    }
  }

  void verifyOTP() async {
    try {
      final res = await http.post(
          Uri.parse(ipInfo + '/Beneficiary/login/verify'),
          headers: <String, String>{
            'Context-Type': 'application/json;charSet=UTF-8'
          },
          body: {
            'email': benificiary.benificiary_email,
            'otp': otp
          });
          print(res.body);
      if(res.statusCode == 200){
        otpverify = true;
        btn = 'Sign in';
        await storage.write(key: "benificiary", value: jsonDecode(res.body)['result']);
      }
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
          Positioned(
              top: 0,
              child: SvgPicture.asset(
                'assets/images/background_2.svg',
                width: w,
                height: h,
              )),
          
          Column(
            children: [
              Expanded(child: Container()),
              Card(
                margin: EdgeInsets.all(0),
                color: primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                elevation: 30,
                child: Container(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                ),
              ),
            ],
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.03,
            top: MediaQuery.of(context).size.height * 0.25,
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
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    Container(
                      // padding: const EdgeInsets.all(15.0),
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Sign in as $user',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 28,
                          color: primary,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.paddingOf(context).top * 0.2),
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          Container(
                            // margin: const EdgeInsets.only(top: 5, left: 8, right: 8),
                            // padding: const EdgeInsets.all(4.0),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.fromLTRB(5, 8, 5, 5),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Email',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 17,
                                          color: primary),
                                    )),
                                TextFormField(
                                  style: TextStyle(fontFamily: 'Montserrat'),
                                  controller: TextEditingController(
                                      text: benificiary.benificiary_email),
                                  onChanged: (value) {
                                    benificiary.benificiary_email = value;
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
                                    contentPadding: EdgeInsets.all(8),
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
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
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
                    Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.paddingOf(context).top * 0.6,
                          bottom: MediaQuery.paddingOf(context).top * 0.3),
                      child: OTPTextField(
                        width: MediaQuery.of(context).size.width * 0.8,
                        controller: otpcontroller,
                        length: 6,
                        contentPadding: EdgeInsets.all(8.0),
                        onChanged: (value) => {otp = value},
                        onCompleted: (value) => {
                          otp = value,
                          verifyOTP(),
                          setState(() { })
                          },
                        // spaceBetween: 2,
                        outlineBorderRadius: 6,
                        style:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 20),
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
                      padding: EdgeInsets.only(left: 12, top: 5),
                      child: Row(
                        children: [
                          Checkbox(
                            value: otpverify, onChanged: (value) {},
                            activeColor: grey,
                            fillColor: MaterialStatePropertyAll(grey),
                            checkColor: primary,
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
                                color: primary,
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
                                    EdgeInsets.all(
                                        MediaQuery.paddingOf(context).top *
                                            0.3)),
                                backgroundColor:
                                    MaterialStatePropertyAll(primary),
                                shape: MaterialStatePropertyAll<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.transparent,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))))),
                            onPressed: () {
                              if(services){
                                if (!otpverify) {
                                sendOTP();
                                // _showDialog();
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BeneficiaryHomeScreen()));
                              }
                              }else{
                                index = 0;
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>BeneficiaryHomeScreen()));
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
