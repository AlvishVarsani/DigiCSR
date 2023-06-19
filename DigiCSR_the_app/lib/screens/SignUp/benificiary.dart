import 'package:digicsr/screens/benificiary/benificiary_screen.dart';
import 'package:digicsr/screens/login/login_screen.dart';
import 'package:digicsr/users/benificiaryuser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../constants/constants.dart';

class BenificiarySignUp extends StatefulWidget {
  @override
  State<BenificiarySignUp> createState() {
    return _BenificiarySignUp();
  }
}

class _BenificiarySignUp extends State<BenificiarySignUp> {
  final _formkey = GlobalKey<FormState>();

  OtpFieldController otpcontroller = OtpFieldController();
  String otp = '';
  bool otpverify = false;

  final BenificiaryUser benificiary = BenificiaryUser();

  bool otpsent = false;

  // TextButton btn = TextButton(onPressed: (){}, child: );

  void sendOTP() async {
    try {
      var res = await http.post(
          Uri.parse(ipInfo + '/Beneficiary/signup'),
          headers: <String, String>{
            'Context-Type': 'application/json;charSet=UTF-8'
          },
          body: {
            'name': benificiary.name,
            'email': benificiary.benificiary_email,
            'mobile_no': benificiary.mobile_no,
            'addhar_no': benificiary.addhar_no
          });
      print(res.body);
      otpsent = true;
    } catch (e) {
      print(e);
    }
  }

  void verifyOTP() {
    try {
      var res = http.post(Uri.parse(ipInfo + '/Beneficiary/verify'),
          headers: <String, String>{
            'Context-Type': 'application/json;charSet=UTF-8'
          },
          body: {
            'name': benificiary.name,
            'email': benificiary.benificiary_email,
            'mobile_no': benificiary.mobile_no,
            'addhar_no': benificiary.addhar_no,
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
      resizeToAvoidBottomInset: false,
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
            top: MediaQuery.of(context).size.height * 0.1,
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
                height: MediaQuery.of(context).size.height * 0.80,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    Container(
                      // padding: const EdgeInsets.all(15.0),
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'SignUp as $user',
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
                                        borderSide: BorderSide(color: primary)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(color: primary)),
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
                          top: MediaQuery.paddingOf(context).top * 0.2),
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          Container(
                            // margin: const EdgeInsets.only(left: 8, right: 8, top: 5),
                            // padding: const EdgeInsets.all(4.0),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.fromLTRB(5, 8, 5, 5),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Name',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 17,
                                          color: primary),
                                    )),
                                TextFormField(
                                  style: TextStyle(fontFamily: 'Montserrat'),
                                  controller: TextEditingController(
                                      text: benificiary.name),
                                  onChanged: (value) {
                                    benificiary.name = value;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter name';
                                    } else {
                                      return 'Invalid name';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8),
                                    // label: Text(
                                    //   'CSR',
                                    //   style: TextStyle(
                                    //       color: darkgrey,
                                    //       fontFamily: 'Montserrat',
                                    //       fontWeight: FontWeight.w800),
                                    // ),
                                    hintText: 'ex. Yashu',
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(color: primary)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(color: primary)),
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
                          top: MediaQuery.paddingOf(context).top * 0.2),
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          Container(
                            // margin: const EdgeInsets.only(left: 8, right: 8, top: 5),
                            // padding: const EdgeInsets.all(4.0),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.fromLTRB(5, 8, 5, 5),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Mobile Number',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 17,
                                          color: primary),
                                    )),
                                TextFormField(
                                  style: TextStyle(fontFamily: 'Montserrat'),
                                  controller: TextEditingController(
                                      text: benificiary.mobile_no),
                                  onChanged: (value) {
                                    benificiary.mobile_no = value;
                                  },
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter mobile number';
                                    } else {
                                      return 'Invalid mobile number';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8),
                                    // label: Text(
                                    //   'CSR',
                                    //   style: TextStyle(
                                    //       color: darkgrey,
                                    //       fontFamily: 'Montserrat',
                                    //       fontWeight: FontWeight.w800),
                                    // ),
                                    hintText: 'ex. 942-7245-632',
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(color: primary)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(color: primary)),
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
                          top: MediaQuery.paddingOf(context).top * 0.2),
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          Container(
                            // margin: const EdgeInsets.only(left: 8, right: 8, top: 5),
                            // padding: const EdgeInsets.all(4.0),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.fromLTRB(5, 8, 5, 5),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Addhar Number',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 17,
                                          color: primary),
                                    )),
                                TextFormField(
                                  style: TextStyle(fontFamily: 'Montserrat'),
                                  controller: TextEditingController(
                                      text: benificiary.addhar_no),
                                  onChanged: (value) {
                                    benificiary.addhar_no = value;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter addhar number';
                                    } else {
                                      return 'Invalid addhar number';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8),
                                    // label: Text(
                                    //   'CSR',
                                    //   style: TextStyle(
                                    //       color: darkgrey,
                                    //       fontFamily: 'Montserrat',
                                    //       fontWeight: FontWeight.w800),
                                    // ),
                                    hintText: 'ex. 1234-5678-9012',
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(color: primary)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(color: primary)),
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
                        onCompleted: (value) => {setState((){
                          otp = value;
                          verifyOTP();
                        })},
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
                            activeColor: primary,
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
                              // (btn == 'Send OTP')
                              //     ? sendOTP()
                              //     : Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) =>
                              //                 Login_Screen()));
                              // if (!otpverify) {
                              //   sendOTP();
                              // } else {
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => BeneficiaryHomeScreen()));
                              // }

                              Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BeneficiaryHomeScreen()));
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
