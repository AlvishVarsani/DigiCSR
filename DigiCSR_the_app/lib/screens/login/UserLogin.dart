import 'package:digicsr/screens/Homescreen/HomeScreenForBenifi.dart';
import 'package:digicsr/screens/Homescreen/mainscreen.dart';
import 'package:digicsr/screens/benificiary/benificiary_screen.dart';
import 'package:digicsr/users/benificiaryuser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../constants/DataLoaders.dart';
import '../../constants/constants.dart';
import '../../services/authentication.dart';

class UserLogin extends StatefulWidget {
  @override
  State<UserLogin> createState() {
    return _UserLogin();
  }
}

class _UserLogin extends State<UserLogin> {
  // final _formkey = GlobalKey<FormState>();
  String email = '';

  OtpFieldController otpcontroller = OtpFieldController();
  String otp = '';
  bool otpverify = false;

  BenificiaryUser benificiary = BenificiaryUser();

  bool otpsent = false;





  String dropdownvalue = 'Company';

  // List of items in our dropdown menu
  var items = [
    'Company',
    'NGO',
    'Benificiary',
  
  ];

  @override
  void setState(VoidCallback fn) {
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
                              {otp = value, setState(() {})},
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
                              onPressed: () async {
                                try {
                                  await sendOTP(email);
                                  var snackBar = SnackBar(
                                      backgroundColor: primary,
                                      padding:
                                          EdgeInsets.only(bottom: 20, top: 20),
                                      content: Text(
                                        'OTP resent to your email!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ));
                                  await ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  Navigator.pop(context);
                                } catch (e) {
                                  var snackBar = SnackBar(
                                      backgroundColor: Colors.red.shade800,
                                      padding:
                                          EdgeInsets.only(bottom: 20, top: 20),
                                      content: Text(
                                        'Unable to sent the otp again',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
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
                              onPressed: () async {
                                await verifyOTP(otp, email);
                                setState(() {});
                                if (user == 'Company') {
                                            await loadCompanyData();
                                            await loadHomeScreen();
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MainScreen()));
                                          } else if (user == 'NGO') {
                                            await loadHomeScreen();
                                            await loadNGOData();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MainScreen()));
                                          } else {
                                            await loadHomeScreen();
                                            print('beni');
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreenForBenifi()));
                                          }
                              },
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              child: Container(
                width: w,
                height: h*0.5,
                color: primary,
              )),
          
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
                  height: h * 0.6,
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
                                        'User',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 20,
                                            color: primary),
                                      )),
                                  Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          border: Border.all(
                                            color: primary,
                                          ),
                                        ),
                                        child: DropdownButton(
                                          elevation: 0,
                                          underline: SizedBox(),

                                          // Initial Value
                                          padding: EdgeInsets.only(left: 10,right: 10),
                                          isExpanded: true,
                                          isDense: false,
                                          
                                          value: dropdownvalue,

                                          // Down Arrow Icon
                                          icon: const Icon(
                                              Icons.keyboard_arrow_down),

                                          // Array list of items
                                          items: items.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items),
                                            );
                                          }).toList(),

                                          onChanged: (newValue) {
                                            setState(() {
                                              user = newValue!;
                                              print(user);
                                              dropdownvalue = newValue;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                          ],
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
                                    controller: TextEditingController(
                                        text: email),
                                    onChanged: (value) {
                                      email = value;
                                    },
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 18,
                                        color: primary),
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
                                      hintText: 'ex. digicsr@gmail.com',
                                      hintStyle: TextStyle(color: primary),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: primary)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: primary)),
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
                        child: Container(
                          height: 20,
                        ),
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
                                shadowColor: MaterialStatePropertyAll(
                                    Colors.transparent),
                                // minimumSize:
                                //     MaterialStatePropertyAll(Size(100, 50)),
                                maximumSize: MaterialStatePropertyAll(
                                    Size((144 < w * 0.4) ? 144 : w * 0.4, 60)),
                                elevation: MaterialStatePropertyAll(20),
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.all(10)),
                                // backgroundColor:
                                //     MaterialStatePropertyAll(primary),
                                shape: MaterialStatePropertyAll<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: primary,
                                            style: BorderStyle.solid,
                                            width: 1.5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))))),
                            onPressed: () async{
                              if (services) {
                                if (!otpverify) {
                                  await sendOTP(email);
                                  _showDialog();
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainScreen()));
                                }
                              } else {
                                index = 0;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainScreen()));
                              }
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