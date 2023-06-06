import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomTextFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      style: TextStyle(fontFamily: 'Montserrat'),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 15, bottom: 15, left: 10),
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
    );
  }
}
