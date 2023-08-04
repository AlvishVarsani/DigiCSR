//   import 'dart:convert';

// import 'package:digicsr/screens/SignUp/company.dart';
// import 'package:http/http.dart' as http;

// import '../constants/constants.dart';

// String BenificiaryLogin = '/Beneficiary/login';
// String BenificiaryLoginVerify = '/Beneficiary/login/verify';
// String NgoLogin = '/NGO/login';
// String NgoLoginVerify = '/NGO/login/verify';
// String CompanyLogin = '/company/login';
// String CompanyLoginVerify = '/company/login/verify';
// String BeneficiarySignup='/Beneficiary/signup';
// String BeneficiarySignupVerify='/Beneficiary/verify';
// String NgoSignup='/ngo/signup';
// String NgoSignupVerify='/ngo/verify';
// String Company_Signup='/company/signup';
// String CompanySignupVerfiy='/company/verify';

  
//   Future sendOTP(String email) async {
//       final resSend = await http.post(
//         Uri.parse(ipInfo + NgoLogin
//         // ((user == 'NGO')?NgoLogin:(user == 'Company')?CompanyLogin:BenificiaryLogin)
//         ),
//           headers: <String, String>{
//             'Context-Type': 'application/json;charSet=UTF-8'
//           },
//           body: {
//             'email': email
//           });
//       // otpsent = true;
//       print(resSend.body);
//      if(resSend.statusCode == 200){
//       print('OTP sent successfully');
//      }else{
//       throw Exception('Unable to send OTP!');
//      }
    
//   }

//     Future verifyOTP(String otp,String email) async {
    
//       var response = await http.post(
//           Uri.parse(ipInfo + NgoLoginVerify
//           // ((user == 'NGO')?NgoLoginVerify:(user == 'Company')?CompanyLoginVerify:BenificiaryLoginVerify)
//           ),
//           headers: <String, String>{
//             'Context-Type': 'application/json;charSet=UTF-8'
//           },
//           body: {
//             'email': email,
//             'otp': otp
//           });
//       if(response.statusCode == 200){
//          btn = 'Sign in';
//          print(response.body);
//         await storage.write(
//             key: "token", value: jsonDecode(response.body)['result']);
//         await storage.write(
//             key: "type", value: jsonDecode(response.body)['type']);
//       print('OTP sent successfully');
//      }else{
//       throw Exception('Unable to send OTP!');
//      }
//   }


//   Future sendOTPCompanySignup(String email,String cin) async {
//       final resSend = await http.post(
//         Uri.parse(ipInfo + Company_Signup
//         // ((user == 'NGO')?NgoLogin:(user == 'Company')?CompanyLogin:BenificiaryLogin)
//         ),
//           headers: <String, String>{
//             'Context-Type': 'application/json;charSet=UTF-8'
//           },
//           body: {
//             'email': email,
//             'cin': cin
//           });
//       // otpsent = true;
//       print(resSend.body);
//      if(resSend.statusCode == 200){
//       print('OTP sent successfully');
//      }else{
//       throw Exception('Unable to send OTP!');
//      }
    
//   }

//     Future verifyOTPNGOSignup(String otp,String email) async {
    
//       var response = await http.post(
//           Uri.parse(ipInfo + NgoSignup
//           // ((user == 'NGO')?NgoLoginVerify:(user == 'Company')?CompanyLoginVerify:BenificiaryLoginVerify)
//           ),
//           headers: <String, String>{
//             'Context-Type': 'application/json;charSet=UTF-8'
//           },
//           body: {
//             'email': email,
//             'otp': otp
//           });
//       if(response.statusCode == 200){
//          btn = 'Sign in';
//          print(response.body);
//         await storage.write(
//             key: "token", value: jsonDecode(response.body)['result']);
//         await storage.write(
//             key: "type", value: jsonDecode(response.body)['type']);
//       print('OTP sent successfully');
//      }else{
//       throw Exception('Unable to send OTP!');
//      }
//   }


import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/constants.dart';

String BenificiaryLogin = '/Beneficiary/login';
String BenificiaryLoginVerify = '/Beneficiary/login/verify';
String NgoLogin = '/NGO/login';
String NgoLoginVerify = '/NGO/login/verify';
String CompanyLogin = '/company/login';
String CompanyLoginVerify = '/company/login/verify';
String BeneficiarySignup='/Beneficiary/signup';
String BeneficiarySignupVerify='/Beneficiary/verify';
String NgoSignup='/ngo/signup';
String NgoSignupVerify='/ngo/verify';
String CompanySignup='/company/signup';
String CompanySignupVerfiy='/company/verify';
  
  Future sendOTP(String email) async {
    print(email);
    String route='';

      if(user=='NGO')
      {
        route=NgoLogin;
      }
      else if(user=='Company')
      {
        route=CompanyLogin;
      }
      else if(user=='Benificiary')
      {
        route=BenificiaryLogin;
      }
    

      final resSend = await http.post(
        Uri.parse(ipInfo + route
        ),
          headers: <String, String>{
            'Context-Type': 'application/json;charSet=UTF-8'
          },
          body: {
            'email': email
          });
      // otpsent = true;
      print(resSend.body);
     if(resSend.statusCode == 200){
      print('OTP sent successfully');
     }else{
      throw Exception('Unable to send OTP!');
     }
    
  }
  Future sendOTPSignup(String email,String code) async {
    String route='';
    Map<String,dynamic>? data;

 if(auth=='signup')
    {
      if(user=='NGO')
      {
        route=NgoSignup;
        data = {
          'email': email,
          'csr': code
        };
      }
      if(user=='Company')
      {
        route=CompanySignup;
        data = {
          'email': email,
          'csr': code
        };
      }
      if(user=='Benificiary')
      {
        route=BeneficiarySignup;
        data = {
          'email': email,
          'csr': code
        };
      }
    }

      final resSend = await http.post(
        Uri.parse(ipInfo + route
        // ((user == 'NGO')?NgoLogin:(user == 'Company')?CompanyLogin:BenificiaryLogin)
        ),
          headers: <String, String>{
            'Context-Type': 'application/json;charSet=UTF-8'
          },
          body: {
            'email': email,
            'cin':code

          });
      // otpsent = true;
      print(resSend.body);
     if(resSend.statusCode == 200){
      print('OTP sent successfully');
     }else{
      throw Exception('Unable to send OTP!');
     }
    
  }

    Future verifyOTP(String otp,String email) async {
      String route='';
       
      if(user=='NGO')
      {
        route=NgoLoginVerify;
      }
      if(user=='Company')
      {
        route=CompanyLoginVerify;
      }
      if(user=='Benificiary')
      {
        route=BenificiaryLoginVerify;
      }
    
      var response = await http.post(
          Uri.parse(ipInfo + '/Beneficiary/login/verify'
          // ((user == 'NGO')?NgoLoginVerify:(user == 'Company')?CompanyLoginVerify:BenificiaryLoginVerify)
          ),
          headers: <String, String>{
            'Context-Type': 'application/json;charSet=UTF-8'
          },
          body: {
            'email': email,
            'otp': otp
          });
      if(response.statusCode == 200){
         btn = 'Sign in';
         print(response.body);
        await storage.write(
            key: "token", value: jsonDecode(response.body)['result']);
      print('OTP sent successfully');
     }else{
      throw Exception('Unable to send OTP!');
     }
  }

  Future verifyOTPSignup(String otp,String email,String code) async {
      String route='';
      Map<String,dynamic>? data;
  
    
      if(user=='NGO')
      {
        route=NgoSignupVerify;
         data = {
          'otp': otp,
          'email': email,
          'csr': code
        };
      }
      else if(user=='Company')
      {
        route=CompanySignupVerfiy;
         data = {
          'otp': otp,
          'email': email,
          'cin': code
        };
      }
      else if(user=='Benificiary')
      {
        route=BeneficiarySignupVerify;
         data = {
          'name': benificiary.name,
            'email': email,
            'mobile_no': benificiary.mobile_no,
            'aadhar_no': benificiary.addhar_no,
            'otp': otp
        };
      }
    
      var response = await http.post(
          Uri.parse(ipInfo + '/ngo/verify'
          // ((user == 'NGO')?NgoLoginVerify:(user == 'Company')?CompanyLoginVerify:BenificiaryLoginVerify)
          ),
          // headers: {
          //   'Content-Type': 'application/json;charSet=UTF-8'
          // },
          body: data
          );
          print(response.body);
      if(response.statusCode == 200){
         btn = 'Sign in';
        await storage.write(
            key: "token", value: jsonDecode(response.body)['result']);
      print('OTP sent successfully');
     }else{
      throw Exception('Unable to send OTP!');
     }
  }


  