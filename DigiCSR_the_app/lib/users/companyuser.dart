// import 'dart:html';

import 'package:file_picker/file_picker.dart';

class CompanyUser{
  String? cin;
  String? company_email;
  String? company_name;
  int? establishment_year;
  String? summary;
  String? pincode;
  String? company_country = 'India';
  String? company_state = 'Gujarat';
  String? company_city = 'Keshod';
  String? cp_name;
  String? cp_email;
  String? cp_designation;
  String? cp_phone;
  List<String>? sectors = [];
  List<String>? tax_comp = [];
  FilePickerResult? registration_certificate; 
}