import 'package:digicsr/models/RFPModel.dart';
import 'package:digicsr/screens/company/CompanyProfile.dart';
import 'package:digicsr/screens/ngo/ngoprofile.dart';
import 'package:digicsr/screens/ngo/Praposal_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../models/CompanyModel.dart';
import '../screens/Homescreen/homescreen.dart';
import '../screens/company/rfp.dart';
import '../services/company_profile_services.dart';
import '../users/companyuser.dart';
import '../users/ngouser.dart';

Color blue = Color(0xFF1DA1F2);

Color grey = Color(0xFFAAB8C2);
Color darkgrey = Color(0xFF657786);
Color primary = Color(0xFF0CB6F0);
Color secondary = Color(0xFFFF6163);
Color white = Color(0xFFFFFFFF);
Color black = Color(0xFF202020);
Color blueglass = Color(0x130CB6F0);

final storage = FlutterSecureStorage();

final CompanyUser company = CompanyUser();
final NGOuser ngo = NGOuser();
final Rfp rfp = Rfp(title: '',timeline: '',states: [],sectors: [],amount: 0,remaining_amount: 0,company: '');
Company companydata = Company();

int index = 0;

String user = '';

String btn = 'Send OTP';
String auth = '';

String appbartitle = 'Home';

String requested_amount = '';

List<Widget> companynav = [HomeScreen(), RFP(), CompanyProfile()];

List<Widget> ngonav = [HomeScreen(), PraposalScreen(), ProfileScreenForNGO()];

final Indianstates = [
  MultiSelectItem<String>('Option 1','Andhra Pradesh'),
  MultiSelectItem<String>('Option 2','Arunachal Pradesh'),
  MultiSelectItem<String>('Option 3','Assam'),
  MultiSelectItem<String>('Option 4','Bihar'),
  MultiSelectItem<String>('Option 5','Chhattisgarh'),
  MultiSelectItem<String>('Option 6','Goa'),
  MultiSelectItem<String>('Option 7','Gujarat'),
  MultiSelectItem<String>('Option 8','Haryana'),
  MultiSelectItem<String>('Option 9','Himachal Pradesh'),
  MultiSelectItem<String>('Option 10','Jammu and Kashmir'),
  MultiSelectItem<String>('Option 11','Jharkhand'),
  MultiSelectItem<String>('Option 12','Karnataka'),
  MultiSelectItem<String>('Option 13','Kerala'),
  MultiSelectItem<String>('Option 14','Madhya Pradesh'),
  MultiSelectItem<String>('Option 15','Maharashtra'),
  MultiSelectItem<String>('Option 16','Manipur'),
  MultiSelectItem<String>('Option 17','Meghalaya'),
  MultiSelectItem<String>('Option 18','Mizoram'),
  MultiSelectItem<String>('Option 19','Nagaland'),
  MultiSelectItem<String>('Option 20','Odisha'),
  MultiSelectItem<String>('Option 21','Punjab'),
  MultiSelectItem<String>('Option 22','Rajasthan'),
  MultiSelectItem<String>('Option 23','Sikkim'),
  MultiSelectItem<String>('Option 24','Tamil Nadu'),
  MultiSelectItem<String>('Option 25','Telangana'),
  MultiSelectItem<String>('Option 26','Tripura'),
  MultiSelectItem<String>('Option 27','Uttar Pradesh'),
  MultiSelectItem<String>('Option 28','West Bengal')
];


// String ipInfo = "http://localhost:4000";
String ipInfo = "http://192.168.155.94:4000";


Future<String?> fetchCompanyToken() {
  return storage.read(key: "company");
}

Future<String?> fetchNGOToken() {
  return storage.read(key: "ngo");
}

Future<String?> fetchBenificiaryToken() {
  return storage.read(key: "benificiary");
}

// List<NotificationModel> addElement(List<NotificationModel> listFuture, Future<NotificationModel> elementsToAdd)async{
//   final list = await listFuture;
//   list.add(await elementsToAdd);
//   return list;
// }

late final TextEditingController _controller;
