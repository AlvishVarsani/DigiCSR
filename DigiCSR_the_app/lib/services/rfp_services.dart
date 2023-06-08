import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../models/RFPModel.dart';

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

Future<List<Rfp>> fetchCompanyRfp(String id) async {
  String? token = await fetchToken();

  final response =
      await http.get(Uri.parse(ipInfo + " /company/rfp" + "?id=$id"), headers: {
    HttpHeaders.authorizationHeader: 'Bearer $token',
  });

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((e) => Rfp.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load RFP data');
  }
}
