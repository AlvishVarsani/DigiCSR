// import 'dart:html';

import 'dart:io';

import 'package:file_picker/file_picker.dart';

class CompanyUser{
  String? cin;
  String? company_email;
  String? company_name='Yashu';
  int? establishment_year = 2000;
  String? summary = 'suma';
  String? pincode ='362220';
  String? company_country = 'India';
  String? company_state = 'Gujarat';
  String? company_city = 'Keshod';
  String? cp_name = 'yashu';
  String? cp_email = 'yashuranparia136@gmail.com';
  String? cp_designation='keshod';
  String? cp_phone = '9426573656';
  List<String>? sectors = [];
  List<String>? tax_comp = [];
  PlatformFile? registration_certificate; 
  File? certificate;
}