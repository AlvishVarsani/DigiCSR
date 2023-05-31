import 'dart:convert';

import 'package:digi_csr/api_dart_flies/company.dart';
import 'package:digi_csr/screen/otp_sceen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart ' as http;

class LoginScreenForCompany extends StatefulWidget {
  const LoginScreenForCompany({super.key});

  @override
  State<LoginScreenForCompany> createState() => _LoginScreenForCompanyState();
}

class _LoginScreenForCompanyState extends State<LoginScreenForCompany> {
  bool isCheck = false;
  var a = '';
  var b = '';
  var c = '';

  List<Company> postList = [];
  var base = 'https://localhost:4000';

// Future<List<P>> getPostApi() async{
//   final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//   var data=jsonDecode(response.body.toString());
//   if(response.statusCode=200)
//   {
//     Map
//   }else{

//   }

// }
  Future<void> otpForCompany() async {
  var url=Uri.parse("$base/company/signup");
    var data = {
      'company_name': a,
      'email': b,
      'crn': c,
    };
    final response =
        await http.post(url, body: data);

    var data2 = jsonDecode(response.body.toString());
    print(url);

    try {
      if (response.statusCode == 200) {

        print(data2);
      } else {
        print('Data not found');
      }
    } catch (e) {
      print(e.toString());
      print('errorzazz11111111');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/companypage2.png"),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Login As Company',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('To join the community of changemarker',
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
                              hintText: 'Enter Your Company Name',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.orange))),
                        ),
                        Text(
                          'CRN',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              a = value; // Update the variable when the input changes
                            });
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Your CNR',
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
                              b = value; // Update the variable when the input changes
                            });
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Your Email_id',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(38, 191, 104, 1)))),
                        ),
                      
                        SizedBox(height: 30,),
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
