
import 'package:digicsr/models/BoardMember.dart';
import 'package:digicsr/models/Donations.dart';
import 'package:digicsr/models/NgoModel.dart';
import 'package:digicsr/models/RFPModel.dart';
import 'package:digicsr/models/couroseldata.dart';
import 'package:digicsr/screens/company/CompanyProfile.dart';
import 'package:digicsr/screens/ngo/NGOProfileScreen.dart';
import 'package:digicsr/screens/ngo/Praposal_Screen.dart';
import 'package:digicsr/services/courosel_services.dart';
import 'package:digicsr/services/ngo_profile_services.dart';
import 'package:digicsr/services/rfp_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../models/CompanyModel.dart';
import '../models/NotificationModel.dart';
import '../screens/Homescreen/homescreen.dart';
import '../screens/company/rfp.dart';
import '../services/company_profile_services.dart';
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
final Company company = Company();
final Ngo ngo = Ngo();
final BoardMember board_member = BoardMember();
 final BenificiaryUser benificiary = BenificiaryUser();
late Future<CouroselData> couroselData;
//  (user == 'NGO')? final User<Ngo> usertype = User(ngo):(user == 'Company')? final User<>;
// final NGOuser ngo = NGOuser();
final Rfp rfp = Rfp();
Company companydata = Company();
Ngo ngodata = Ngo();

late Future<List<NotificationModel>> NGOnotifications;

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


// String ipInfo = "http://127.0.0.1:4000";
String ipInfo = "http://192.168.155.94:4000";

Future<String> getCompanyId()async{
  String? token = await fetchCompanyToken();
  Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
  String companyid = decodedToken['_id'];
  return companyid;
}
Future<String> getNgoId()async{
  String? token = await fetchNGOToken();
  Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
  String Ngoid = decodedToken['_id'];
  return  Ngoid;
}

void loadCompanyData(){
  getCmpLogo();
  getCompanyDetails();
  // getCmpCertificate();
  print('Company data Loaded!');
}

void loadNGOData(){
  getNgoDetails();
  NgoLogo();
}

Future<Rfp> loadCompanyRfp(String rfpid)async{
  Rfp data = await fetchRfpDetails(rfpid);
  data.donations = Donations.giveDonationslist(data.donation_requests);
  return data;
}

Future<String> getCmpLogo()async{
  String cmpid = await getCompanyId();
  return getCompanyLogo(cmpid);
}

Future<String> NgoLogo()async{
  String cmpid = await getNgoId();
  return getNgoLogo(cmpid);
}

Future<String> getCmpCertificate()async{
  String cmpid = await getCompanyId();
  return fetchCompanyCertificate(cmpid);
}

Future<String?> fetchCompanyToken() {
  return storage.read(key: "company");
}

Future<String?> fetchNGOToken() {
  return storage.read(key: "ngo");
}

Future<String?> fetchBenificiaryToken() {
  return storage.read(key: "benificiary");
}

void getCompanyDetails()async{
    companydata = await fetchCompany();
    companydata.cmp_logo_path = await getCmpLogo();
    print(companydata.company_name);
  }
    
    //Ngo details for user as NGO
    void getNgoDetails()async{
  String ngoid = await getNgoId();
  ngodata = await getNGODetailsById(ngoid);
  ngodata.boardmemberslist = BoardMember.givelist(ngodata.board_members);
  ngodata.ngo_logo_path = await NgoLogo();
    }

Future<Ngo> getNGODetailsById(String id)async{
    return await fetchNgoProfile(id);
  }

//Ngo details for user as Company or Benificiary
  Future<Ngo> getNgoDetailsForOthers(String id)async{
    Ngo ngoforother = await getNgoProfile(id);
    ngoforother.boardmemberslist = BoardMember.givelist(ngoforother.board_members);
    ngoforother.ngo_logo_path = await getNgoLogoForBenificiary(id);
    return ngoforother;
  }


late final TextEditingController _controller;
