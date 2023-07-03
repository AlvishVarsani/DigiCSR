import 'dart:convert';
import 'dart:io';

import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/models/CompanyModel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http_parser/src/media_type.dart';
// import 'package:path_provider/path_provider.dart';


//get company profile
Future<Company> fetchCompany() async {
  final token = await fetchCompanyToken();
  print(token);
  Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
  String id = decodedToken['_id'];
  print(decodedToken['_id']);
  var response = await http.get(Uri.parse(ipInfo + "/company/profile/$id"),
      headers: {
        'Content-Type': 'application/json;charSet=UTF-8',
        'authorization': token
      }
      );
print(response.body);
  if (response.statusCode == 200) {
    print(jsonDecode(response.body)['data']);
    return Company.fromJson(jsonDecode(response.body)['data']);
  } else {
    throw Exception("Something went wrong");
  }
}



Future<PlatformFile> getCompanyLogo(String cmpid)async{
  String? token = await fetchCompanyToken();

  var response = await http.get(
    Uri.parse(ipInfo + '/company/logo/${cmpid}'),
    headers: {
      'Content-Type': 'application/json;charSet=UTF-8',
      'authorization': token!
    }
    );

  print(response.body);
  if(response.statusCode == 200){
    return jsonDecode(response.body);
  }else{
    throw Exception('Can not load the Logo');
  }
}

void postCompanyLogo(String cmpid)async{
  String? token = await fetchCompanyToken();

  var request = await http.MultipartRequest(
    'POST',Uri.parse(ipInfo + '/company/upload-logo'),
  );

  request.headers["Content-Type"] = "multipart/form-data";
  request.headers["authorization"] = token.toString();

  var company_logo = await http.MultipartFile.fromPath('company_logo', company.company_logo!.path!);

  request.files.add(company_logo);

  var response = await request.send();

  if(response.statusCode == 200){
    print('Logo Uploaded');
  }else{
    throw Exception('Unablt to upload the Logo');
  }
  // print(response);
  // if(response.statusCode == 200){
  //   print(jsonDecode(response.body));
  // }else{
  //   throw Exception('Unable to upload the Logo!');
  // }
}

Future fetchCompanyCertificate(String id) async {
  String? token = await fetchCompanyToken();

  var response = await http.get(Uri.parse(ipInfo + "/company/certificate/$id"),
      headers: {HttpHeaders.authorizationHeader: 'Bearer  $token'});

  if (response.statusCode == 200) {
    final Directory directory = await getApplicationDocumentsDirectory();
    final savePath = '${directory.path}/$id.pdf';

    final file = File(savePath);

    await file.writeAsBytes(response.bodyBytes);

    debugPrint("file downloaded");
  } else {
    throw Exception("Error while downloading pdf");
  }
}

Future updateCompanyProfile(
    String id, Map<String, String> updatedData, File image) async {
  String? token = await fetchCompanyToken();

  var request = http.MultipartRequest(
      'POST', Uri.parse(ipInfo + "/company/add-profile/$id"));

  request.headers[HttpHeaders.authorizationHeader] = "Bearer $token";
  request.fields.addAll(updatedData);
  request.files.add(
    http.MultipartFile.fromBytes('file', File(image.path).readAsBytesSync(),
        filename: image.path),
  );

  await request.send();
}

void AddCompanayProfile()async{
  String? token = await fetchCompanyToken();
  print(token.toString());

  var request = http.MultipartRequest('POST', Uri.parse(ipInfo + '/company/add-profile'),);
  print(company.tax_comp);
  // print(tax_comp);
  // int? establishment_year = company.establishment_year;

// request.headers["Content-Type"] = "multipart/form-data";
request.headers["authorization"] = token.toString();

request.fields['company_name'] = company.company_name!;
print('name done');
request.fields['summary'] = company.summary!;
request.fields['city'] = company.city!;
request.fields['state'] = company.state!;
request.fields['pincode'] = company.pincode!;
request.fields['establishment_year'] = company.establishment_year.toString();
request.fields['cp_name'] = company.cp_name!;
request.fields['cp_email'] = company.cp_email!;
request.fields['cp_designation'] = company.cp_designation!;
request.fields['cp_phone'] = company.cp_phone!;

for (int i = 0; i < company.tax_comp!.length; i++) {
  request.files.add(http.MultipartFile.fromString("tax_comp[$i]", company.tax_comp![i], contentType: MediaType("application", "json")));
}

for (int i = 0; i < company.sectors!.length; i++) {
  request.files.add(http.MultipartFile.fromString("sectors[$i]", company.sectors![i], contentType: MediaType("application", "json")));
}

var registrationCertificateFile = await http.MultipartFile.fromPath('registration_certificate', company.registration_certificate!.path!);
// var companyLogoFile = await http.MultipartFile.fromPath('company_logo', 'path/to/company_logo');

request.files.add(registrationCertificateFile);
// request.files.add(companyLogoFile);

var response = await request.send();
 response.stream.transform(utf8.decoder).listen((data) {
      print(data);
      // Do something with data
    });

if (response.statusCode == 200) {
  // The request was successful
  print('Uploaded!');
} else {
  // The request failed
  print('Failed!');
}
}
