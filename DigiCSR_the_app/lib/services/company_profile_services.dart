import 'dart:convert';
import 'dart:io';

import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/models/CompanyModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:path_provider/path_provider.dart';

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

void CompanayProfile()async{
  final token = fetchCompanyToken();

  var request = http.MultipartRequest('POST', Uri.parse(ipInfo + '/company/add-profile'));

request.fields['company_name'] = company.company_name!;
request.fields['summary'] = company.summary!;
request.fields['city'] = company.company_city!;
request.fields['state'] = company.company_state!;
request.fields['pincode'] = company.pincode!;
request.fields['establishment_year'] = jsonEncode(company.establishment_year);
request.fields['cp_name'] = company.cp_name!;
request.fields['cp_email'] = company.cp_email!;
request.fields['cp_designation'] = company.cp_designation!;
request.fields['cp_phone'] = company.cp_phone!;
request.fields['tax_comp'] = jsonEncode(company.tax_comp);
request.fields['sectors'] = jsonEncode(company.sectors);

// var registrationCertificateFile = await http.MultipartFile.fromPath('registration_certificate', 'path/to/registration_certificate');
// var companyLogoFile = await http.MultipartFile.fromPath('company_logo', 'path/to/company_logo');

// request.files.add(registrationCertificateFile);
// request.files.add(companyLogoFile);

var response = await request.send();

if (response.statusCode == 200) {
  // The request was successful
  print('Uploaded!');
} else {
  // The request failed
  print('Failed!');
}
}
