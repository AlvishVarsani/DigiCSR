import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Color blue = Color(0xFF1DA1F2);
Color black = Color.fromARGB(255, 29, 34, 39);
Color grey = Color(0xFFAAB8C2);
Color darkgrey = Color(0xFF657786);

late var res;
final storage = FlutterSecureStorage();

String user = '';

String btn = 'Send OTP';
String auth = '';

String ipInfo = "http://192.168.1.3:4000";
