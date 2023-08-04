

import 'package:digicsr/constants/providers.dart';
import 'package:digicsr/models/BoardMember.dart';
import 'package:digicsr/models/NgoModel.dart';
import 'package:digicsr/models/RFPModel.dart';
import 'package:digicsr/models/ReviewNGOModel.dart';
import 'package:digicsr/screens/benificiary/benificiary_screen.dart';
import 'package:digicsr/screens/company/CompanyProfile.dart';
import 'package:digicsr/screens/ngo/NGOProfileScreen.dart';
import 'package:digicsr/screens/ngo/Praposal_Screen.dart';
import 'package:digicsr/services/ngo_profile_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../models/Charts.dart';
import '../models/CompanyModel.dart';
import '../models/Courosel_Data.dart';
import '../models/Media.dart';
import '../models/NotificationModel.dart';
import '../screens/Homescreen/homescreen.dart';
import '../screens/company/rfp.dart';
import '../users/benificiaryuser.dart';

Color blue = Color(0xFF1DA1F2);

Color grey = Color(0xFFAAB8C2);
Color darkgrey = Color(0xFF657786);
Color primary = Color(0xFF0CB6F0);
Color secondary = Color(0xFFFF6163);
Color white = Color(0xFFFFFFFF);
Color black = Color(0xFF202020);
Color blueglass = Color(0x130CB6F0);

final storage = FlutterSecureStorage();
final storagefortype = FlutterSecureStorage();
AuthProvider authProvider = AuthProvider();
final Company company = Company();
final Ngo ngo = Ngo();
final BoardMember board_member = BoardMember();
 final BenificiaryUser benificiary = BenificiaryUser();
 final ReviewNgo reviewNgo = ReviewNgo();

  late Future<CouroselData> couroseldata;
  late List<Media>? posts;
  late Future<List<ReviewNgo>> reviewngodata;
  late List<Chart> charts;
  late List<SectorsChart> sectorschart;
//  (user == 'NGO')? final User<Ngo> usertype = User(ngo):(user == 'Company')? final User<>;
// final NGOuser ngo = NGOuser();
final Rfp rfp = Rfp();
Company companydata = Company();
Ngo ngodata = Ngo();

List<NotificationModel>? Allnotifications;

int index = 0;

bool services = true;
bool editmode = false;
bool multilist = false;
bool unread_notification = false;

String user = '';

String btn = 'Send OTP';
String auth = '';

String male = 'unselected';
String female = 'unselected';
String other = 'unselected';

String appbartitle = 'Home';

String requested_amount = '';

List<Widget> companynav = [HomeScreen(), RFP(), CompanyProfile()];

List<Widget> ngonav = [HomeScreen(), PraposalScreen(), NGOProfile()];

List<Widget> benificiarynav= [HomeScreen(), BeneficiaryHomeScreen(), Container()];

final Indianstates = [
  MultiSelectItem<String>('Andhra Pradesh','Andhra Pradesh'),
  MultiSelectItem<String>('Arunachal Pradesh','Arunachal Pradesh'),
  MultiSelectItem<String>('Assam','Assam'),
  MultiSelectItem<String>('Bihar','Bihar'),
  MultiSelectItem<String>('Chhattisgarh','Chhattisgarh'),
  MultiSelectItem<String>('Goa','Goa'),
  MultiSelectItem<String>('Gujarat','Gujarat'),
  MultiSelectItem<String>('Haryana','Haryana'),
  MultiSelectItem<String>('Himachal Pradesh','Himachal Pradesh'),
  MultiSelectItem<String>('Jammu and Kashmir','Jammu and Kashmir'),
  MultiSelectItem<String>('Jharkhand','Jharkhand'),
  MultiSelectItem<String>('Karnataka','Karnataka'),
  MultiSelectItem<String>('Kerala','Kerala'),
  MultiSelectItem<String>('Madhya Pradesh','Madhya Pradesh'),
  MultiSelectItem<String>('Maharashtra','Maharashtra'),
  MultiSelectItem<String>('Manipur','Manipur'),
  MultiSelectItem<String>('Meghalaya','Meghalaya'),
  MultiSelectItem<String>('Mizoram','Mizoram'),
  MultiSelectItem<String>('Nagaland','Nagaland'),
  MultiSelectItem<String>('Odisha','Odisha'),
  MultiSelectItem<String>('Punjab','Punjab'),
  MultiSelectItem<String>('Rajasthan','Rajasthan'),
  MultiSelectItem<String>('Sikkim','Sikkim'),
  MultiSelectItem<String>('Tamil Nadu','Tamil Nadu'),
  MultiSelectItem<String>('Telangana','Telangana'),
  MultiSelectItem<String>('Tripura','Tripura'),
  MultiSelectItem<String>('Uttar Pradesh','Uttar Pradesh'),
  MultiSelectItem<String>('West Bengal','West Bengal')
];

final sectoroptions = [
    MultiSelectItem<String>('Rural Development', "Rural Development"),
    MultiSelectItem<String>('Encouraging Sports', "Encouraging Sports"),
    MultiSelectItem<String>('Encouraging Sports', "Encouraging Sports"),
    MultiSelectItem<String>('Swachh Bharat', "Swachh Bharat"),
    MultiSelectItem<String>('Health & Sanitation', "Health & Sanitation"),
    MultiSelectItem<String>(
        'Education, Differently Abled, Livelihood', "Education, Differently Abled, Livelihood"),
    MultiSelectItem<String>('Gender Equality, Women Empowerment, Old Age Homes, Reducing Inequalities',
        "Gender Equality, Women Empowerment, Old Age Homes, Reducing Inequalities"),
    MultiSelectItem<String>(
        'Environment, Animal Welfare, Conservation of Resources', "Environment, Animal Welfare, Conservation of Resources"),
    MultiSelectItem<String>('Slum Development', "Slum Development"),
    MultiSelectItem<String>('Heritage Art And Culture', "Heritage Art And Culture"),
    MultiSelectItem<String>(
        'Prime Minister National Relief Funds', "Prime Minister National Relief Funds"),
    MultiSelectItem<String>('others', "others"),
  ];

//for the taxes selection in companies
  bool? firstcheck = false;
  bool? secondcheck = false;
  bool? thirdcheck = false;
  bool? fourthcheck = false;

// String ipInfo = "http://127.0.0.1:4000";
String ipInfo = "http://192.168.198.94:4000";


//Ngo details for user as Company or Benificiary
  Future<Ngo> getNgoDetailsForOthers(String id)async{
    Ngo ngoforother = await getNgoProfile(id);
    ngoforother.boardmemberslist = BoardMember.givelist(ngoforother.board_members);
    ngoforother.ngo_logo_path = await getNgoLogoForBenificiary(id);
    return ngoforother;
  }


late final TextEditingController _controller;
