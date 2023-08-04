import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String? _jwtToken;
  String? _userType;


  String? get jwtToken => _jwtToken;
  String? get userType => _userType;

  void setTokenAndUserType(String token, String userType) {
    _jwtToken = token;
    _userType = userType;
    notifyListeners();
  }

  // Other methods related to authentication can be added here
}
