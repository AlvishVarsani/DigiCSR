import 'dart:html';

import 'package:file_picker/file_picker.dart';

class CompanyUser{
  String cin = '';
  String company_email = '';
  String company_name = '';
  NumberInputElement establishment_year = NumberInputElement();
  String? summary;
  String? company_country;
  String? company_state;
  String? company_city;
  String cp_name = '';
  String cp_email = '';
  String cp_designation = '';
  String cp_phone = '';
  List<String> sectors = [];
  FilePickerResult? registration_certificate; 
}