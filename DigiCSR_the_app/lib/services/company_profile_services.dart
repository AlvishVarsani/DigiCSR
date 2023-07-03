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


//get company logo
Future<String> getCompanyLogo(String cmpid)async{
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
    return jsonDecode(response.body)['LogoURL'];
  }else{
    throw Exception('Can not load the Logo');
  }
}

//post company logo
void postCompanyLogo()async{
  String? token = await fetchCompanyToken();

  var request = await http.MultipartRequest('POST',Uri.parse(ipInfo + '/company/upload-logo'));

  request.headers["Content-Type"] = "multipart/form-data";
  request.headers["authorization"] = token.toString();


  var fileStream = http.ByteStream(company.company_logo!.openRead());
  var fileSize = await company.company_logo!.length();
  var company_logo = await http.MultipartFile('file',fileStream,fileSize,filename: company.company_logo!.path.split('/').last );

  request.files.add(company_logo);

  var response = await request.send();

  response.stream.transform(utf8.decoder).listen((data) {
      print(data);
    });

  if(response.statusCode == 200){
    print('Logo Uploaded Successfully!');
  }else{
    throw Exception('Unablt to upload the Logo');
  }
}

//post company certificate
void postCompanyCertificate()async{
  String? token = await fetchCompanyToken();

  var request = await http.MultipartRequest(
    'POST',Uri.parse(ipInfo + '/company/upload-certificate'),
  );

  request.headers["Content-Type"] = "multipart/form-data";
  request.headers["authorization"] = token.toString();

  var fileStream = http.ByteStream(company.registration_certificate!.openRead());
  var fileSize = await company.registration_certificate!.length();
  var registration_certificate = await http.MultipartFile('file', fileStream,fileSize,filename: company.registration_certificate!.path.split('/').last );
  request.files.add(registration_certificate);

  var response = await request.send();

   response.stream.transform(utf8.decoder).listen((data) {
      print(data);
    });
  if(response.statusCode == 200){
    print('Certificate Uploaded Successfully!');
  }else{
    throw Exception('Unable to upload the Certificate');
  }
}

Future<String> fetchCompanyCertificate(String cmpid) async {
  String? token = await fetchCompanyToken();

  var response = await http.get(Uri.parse(ipInfo + "/company/certificate/$cmpid"),
      headers: {HttpHeaders.authorizationHeader: 'Bearer  $token'});

  if (response.statusCode == 200) {
    // final Directory directory = await getApplicationDocumentsDirectory();
    // final savePath = '${directory.path}/$cmpid.pdf';

    // final file = File(savePath);

    // await file.writeAsBytes(response.bodyBytes);
    return jsonDecode(response.body);
    // debugPrint("file downloaded");
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

//headers
request.headers["Content-Type"] = "multipart/form-data";
request.headers["authorization"] = token.toString();

//f
request.fields['company_name'] = company.company_name!;
request.fields['summary'] = company.summary!;
request.fields['city'] = company.city!;
request.fields['state'] = company.state!;
request.fields['pincode'] = company.pincode!;
request.fields['establishment_year'] = company.establishment_year.toString();
request.fields['cp_name'] = company.cp_name!;
request.fields['cp_email'] = company.cp_email!;
request.fields['cp_designation'] = company.cp_designation!;
request.fields['cp_phone'] = company.cp_phone!;

//list of taxes of company
for (int i = 0; i < company.tax_comp!.length; i++) {
  request.files.add(http.MultipartFile.fromString("tax_comp[$i]", company.tax_comp![i], contentType: MediaType("application", "json")));
}

//list of sectors of company
for (int i = 0; i < company.sectors!.length; i++) {
  request.files.add(http.MultipartFile.fromString("sectors[$i]", company.sectors![i], contentType: MediaType("application", "json")));
}

var response = await request.send();
//  response.stream.transform(utf8.decoder).listen((data) {
//       print(data);
//       // Do something with data
//     });

if (response.statusCode == 200) {
  // The request was successful
  print('Uploaded!');
} else {
  // The request failed
  print('Failed!');
}
}
