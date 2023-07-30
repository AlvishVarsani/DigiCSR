import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../models/BoardMember.dart';
import '../models/Donations.dart';
import '../models/NgoModel.dart';
import '../models/RFPModel.dart';
import '../services/charts_services.dart';
import '../services/company_profile_services.dart';
import '../services/courosel_services.dart';
import '../services/media_services.dart';
import '../services/ngo_profile_services.dart';
import '../services/notificatio_services.dart';
import '../services/rfp_services.dart';
import 'constants.dart';

//token
Future<String?> Token() {
  Future<String?> token;
  if (user == "NGO") {
    token = storage.read(key: "ngo");
  } else if (user == "Company") {
    token = storage.read(key: "company");
  } else {
    token = storage.read(key: "benificiary");
  }
  return token;
}

//--------------------------Company data load---------------------------
Future loadCompanyData() async{
  await getCompanyDetails();
  charts = getCharts();
  sectorschart = getCompanySectorsChart();

  print('Company data Loaded!');
}

Future getCompanyDetails() async {
  companydata = await fetchCompany();
  companydata.cmp_logo_path = await getCmpLogo();
  // companydata.cmp_certificate_path = await getCmpCertificate();
  print(companydata.company_name);
}

Future<String> getCompanyId() async {
  String? token = await Token();
  Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
  String companyid = decodedToken['_id'];
  return companyid;
}

Future<String> getCmpLogo() async {
  String cmpid = await getCompanyId();
  return getCompanyLogo(cmpid);
}

Future<Rfp> loadCompanyRfp(String rfpid)async{
  Rfp data = await fetchRfpDetails(rfpid);
  data.donations = Donations.giveDonationslist(data.donation_requests);
  return data;
}

Future<String> getCmpCertificate() async {
  String cmpid = await getCompanyId();
  return fetchCompanyCertificate(cmpid);
}


//--------------------------Ngo data load---------------------------
Future loadNGOData() async{
  await getNgoDetails();
  charts = getNgoCharts();
  sectorschart = getNgoSectorsChart();
}

Future<Ngo> getNGODetailsById(String id) async {
  return await fetchNgoProfile(id);
}

//Ngo details for user as NGO
Future getNgoDetails() async {
  String ngoid = await getNgoId();
  ngodata = await getNGODetailsById(ngoid);
  ngodata.boardmemberslist = BoardMember.givelist(ngodata.board_members);
  ngodata.ngo_logo_path = await NgoLogo();
}

Future<String> NgoLogo() async {
  String cmpid = await getNgoId();
  return getNgoLogo(cmpid);
}

Future<String> getNgoId() async {
  String? token = await Token();
  Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
  String Ngoid = decodedToken['_id'];
  return Ngoid;
}


//--------------------------Home Screen---------------------------------------
Future loadHomeScreen()async{
  posts = await getMediaPosts();
  charts = getCharts();
  sectorschart = getCompanySectorsChart();
  await loadCaurosal();
}

Future loadCaurosal()async{
  couroseldata = getCouroselData();
}


//--------------------------Notifications data load---------------------------
void loadNotifications()async{
      try {
        Allnotifications = await notify();
      } catch (e) {
        print('No Notifications found');
      }
}
