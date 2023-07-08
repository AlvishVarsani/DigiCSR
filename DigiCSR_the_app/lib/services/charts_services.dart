import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import '../constants/constants.dart';
import '../models/Charts.dart';
import '../models/RFPModel.dart';

Future<Chart> getCharts() async {
  String? token = await fetchCompanyToken();
  final response = await http.get(
    Uri.parse(ipInfo + '/charts/year'),
    headers: {
      'Content-Type': 'application/json;charSet=UTF-8',
      'authorization': token!
    },
  );
  print(response.body);
  if(response.statusCode == 200){
    print('Charts are fetched');
    return Chart.fromJson(jsonDecode(response.body)['result']);
  }else{
    throw Exception('Can not fetch charts!');
  }
}
