import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../screens/Homescreen/homescreen.dart';
import '../screens/company/rfp.dart';
import '../screens/ngo/rfpngo.dart';


Color blue = Color(0xFF1DA1F2);
Color black = Color(0xFF202020);
Color grey = Color(0xFFAAB8C2);
Color darkgrey = Color(0xFF657786);
Color primary = Color(0xFF0CB6F0);
Color secondary = Color(0xFFFF6163);
Color white= Color(0xFFFFFFFF);

late var res;
final storage = FlutterSecureStorage();

String user = '';

String btn = 'Send OTP';
String auth = '';


List<Widget> pages = [
  HomeScreen(),
  RFP(),
  RFPngo()
];