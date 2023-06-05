// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class CompanySignupPage extends StatefulWidget {
//   @override
//   _CompanySignupPageState createState() => _CompanySignupPageState();
// }

// class _CompanySignupPageState extends State<CompanySignupPage> {
//   final _formKey = GlobalKey<FormState>();

//   String crn = '';
//   String companyName = '';
//   String email = '';

//   Future<void> signupCompany() async {
//     if (_formKey.currentState!.validate()) {
//     print("called...............................");
  
//       // print(crn , companyName , email)

//       try {
//       final url ="http://100.96.202.162:4000/company/signup";
//         print("inside try........");
//         final response = await http.post(
      
//           Uri.parse(url),
//           body: json.encode({
//             'crn': crn,
//             'company_name': companyName,
//             'email': email,
//           }),
//           headers: {
//             'Content-Type': 'application/json',
//           },
//         );
//         final responseData = json.decode(response.body);
//         print(responseData);
//         if (responseData['success']) {
//           // Company signup successful
//           showDialog(
//             context: context,
//             builder: (_) => AlertDialog(
//               title: Text('Success'),
//               content: Text(responseData['message']),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text('OK'),
//                 ),
//               ],
//             ),
//           );
//         } else {
//           // Company signup failed
//           showDialog(
//             context: context,
//             builder: (_) => AlertDialog(
//               title: Text('Error'),
//               content: Text(responseData['message']),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text('OK'),
//                 ),
//               ],
//             ),
//           );
//         }
//       } catch (error) {
//         // Error occurred
//         showDialog(
//           context: context,
//           builder: (_) => AlertDialog(
//             title: Text('Error'),
//             content: Text(error.toString()),
//             // content: Text('An error occurred while signing up the company.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Company Signup'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'CRN',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter CRN';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     crn = value;
//                   });
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Company Name',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter company name';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     companyName = value;
//                   });
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter email';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     email = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: signupCompany,
//                 child: Text('Sign up Company'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

