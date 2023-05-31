import 'package:digi_csr/screen/otp_sceen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class LoginScreenForUsers extends StatefulWidget {
  const LoginScreenForUsers({super.key});

  @override
  State<LoginScreenForUsers> createState() => _LoginScreenForUsersState();
}

class _LoginScreenForUsersState extends State<LoginScreenForUsers> {
  bool isCheck=false;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/userspage.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Login as Users',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('To join the community of changrmarker',
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w400,color: Colors.black)),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            onChanged: (value) {
                              setState(() {
                                 // Update the variable when the input changes
                              });
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter Your Name',
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.orange))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Email',
                            style: TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            onChanged: (value) {
                              setState(() {
                               // Update the variable when the input changes
                              });
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter Your Email_id',
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(38, 191, 104, 1)))),
                          ),
                         
                        
                          // Text(
                          //   'Password',
                          //   style: TextStyle(
                          //       color: Colors.green, fontWeight: FontWeight.bold),
                          // ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          // TextFormField(
                          //   decoration: InputDecoration(
                          //       border: OutlineInputBorder(),
                          //       hintText: 'Enter Your Password',
                          //       focusedBorder: OutlineInputBorder(
                          //           borderSide: BorderSide(
                          //               color: Color.fromRGBO(38, 191, 104, 1)))),
                          // ),
                          // Row(
                          //   children: [
                          //     Checkbox(
                          //         activeColor: Colors.green,
                          //         checkColor: Colors.white,
                          //         value: isCheck,
                          //         onChanged: (newValue) {
                          //           setState(() {
                          //             isCheck = true;
                          //           });
                          //         }),
                          //     SizedBox(
                          //       width: 10,
                          //     ),
                          //     Expanded(
                          //       child: RichText(
                          //         text: TextSpan(children: [
                          //           TextSpan(
                          //               text: "I agree the ",
                          //               style: TextStyle(color: Colors.grey)),
                          //           TextSpan(
                          //               text: "team And Cond",
                          //               style: TextStyle(color: Colors.green)),
                          //           TextSpan(
                          //               text: " & ",
                          //               style: TextStyle(color: Colors.grey)),
                          //           TextSpan(
                          //               text: "privacy Policy",
                          //               style: TextStyle(color: Colors.green))
                          //         ]),
                          //       ),
                          //     )
                          //   ],
                          // ),
                          SizedBox(height: 20,),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                fixedSize: Size(550, 42)),
                            onPressed: () {
                              Get.to(()=>OTPScreen());
                            },
                            child: Text(
                              'Send OTP',
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                            ),
                          ),
                         
                          
                         
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
    );
    
    
  }
}