import 'dart:convert';
import 'dart:io';

import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/models/NgoModel.dart';

import 'package:http/http.dart' as http;

Future<Ngo> fetchNgoProfile(String id) async {
  String? token = await fetchToken();

  var response = await http.get(
    Uri.parse(ipInfo + "/NGO/profile/$id"),
    headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
  );

  if (response.statusCode == 200) {
    return Ngo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Something went wrong");
  }
}

Future<void> updateNgoProfile(
    String id, Map<String, String> updatedData, File image) async {
  String? token = await fetchToken();

  var request = http.MultipartRequest(
    'POST',
    Uri.parse(ipInfo + "/NGO/add-profile/$id"),
  );

  request.headers[HttpHeaders.authorizationHeader] = "Bearer $token";
  request.fields.addAll(updatedData);
  request.files.add(
    http.MultipartFile.fromBytes('file', File(image.path).readAsBytesSync(),
        filename: image.path),
  );

  await request.send();
}
