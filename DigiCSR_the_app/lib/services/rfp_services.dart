import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../models/RFPModel.dart';

Future<List<Rfp>> fetchAllRfp() async {
  final response = await http.get(Uri.parse(ipInfo + "/rfps"));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((e) => Rfp.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load RFP data');
  }
}

Future<List<Rfp>> fetchCompanyRfp(String id) async {
  final response =
      await http.get(Uri.parse(ipInfo + "/company/rfp" + "?id=$id"));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((e) => Rfp.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load RFP ddata');
  }
}
