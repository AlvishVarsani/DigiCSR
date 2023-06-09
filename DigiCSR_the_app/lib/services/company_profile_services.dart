import 'dart:convert';
import 'dart:io';

import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/models/CompanyModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
// import 'package:path_provider/path_provider.dart';

Future<Company> fetchCompany(String id) async {
  String? token = await fetchToken();

  var response = await http.get(Uri.parse(ipInfo + "/company/$id"),
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

  if (response.statusCode == 200) {
    return Company.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Something went wrong");
  }
}

Future fetchCompanyCertificate(String id) async {
  String? token = await fetchToken();

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
  String? token = await fetchToken();

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
