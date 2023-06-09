import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../models/RFPModel.dart';

void addRFP(Map<String,String> body) async {
  final token = await fetchToken();
  print(token);
  final response = await http.post(Uri.parse(ipInfo + "/add-rfp"),
  headers: {
    'Context-Type': 'application/json;charSet=UTF-8',
    'authorization': token!
  },
  body: body
  );
  print(response.body);
  if (response.statusCode == 200) {
    print(response.body);
  } else {
    throw Exception('Failed to put RFP data');
  }
}

Future<List<Rfp>> fetchAllRfp() async {
  // fetch the token
  String? token = await fetchToken();

  final response = await http.get(Uri.parse(ipInfo + "/rfps"), headers: {
    HttpHeaders.authorizationHeader: 'Bearer $token',
  });

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((e) => Rfp.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load RFP data');
  }
}

Future<List<Rfp>> fetchCompanyRfp() async {
  final token = await fetchToken();
  final response =
      // await http.get(Uri.parse(ipInfo + "/company/rfp" + "?id=$id"));
      await http.get(Uri.parse(ipInfo + "/company/rfp"),
      headers: {
        'Context-Type': 'application/json;charSet=UTF-8',
        'authorization': token!
      }
      );
print(response);
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((e) => Rfp.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load RFP data');
  }
}
