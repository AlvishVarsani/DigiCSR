import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';
import '../models/Charts.dart';

Future<List<Chart>> getCharts() async {
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
    final List<dynamic> data = jsonDecode(response.body)['result'];
      return data.map((e) => Chart.fromJson(e)).toList();
  }else{
    throw Exception('Can not fetch charts!');
  }
}


Future<List<Chart>> getNgoCharts()async{
  String? token = await fetchNGOToken();
  final response = await http.get(
    Uri.parse(ipInfo + '/charts/ngo/year'),
    headers: {
      'Content-Type': 'application/json;charSet=UTF-8',
      'authorization': token!
    },
  );
  print(response.body);
  if(response.statusCode == 200){
    print('Charts are fetched');
    final List<dynamic> data = jsonDecode(response.body)['result'];
      return data.map((e) => Chart.fromJson(e)).toList();
  }else{
    throw Exception('Can not fetch charts!');
  }
}
Future<List<SectorsChart>> getCompanySectorsChart()async{
  String? token = await fetchCompanyToken();
  final response = await http.get(
    Uri.parse(ipInfo + '/charts/sector'),
    headers: {
      'Content-Type': 'application/json;charSet=UTF-8',
      'authorization': token!
    },
  );
  print(response.body);
  if(response.statusCode == 200){
    print('Charts are fetched');
    final List<dynamic> data = jsonDecode(response.body)['result'];
      return data.map((e) => SectorsChart.fromJson(e)).toList();
  }else{
    throw Exception('Can not fetch charts!');
  }
}
Future<List<SectorsChart>> getNgoSectorsChart()async{
  String? token = await fetchNGOToken();
  final response = await http.get(
    Uri.parse(ipInfo + '/charts/ngo/sector'),
    headers: {
      'Content-Type': 'application/json;charSet=UTF-8',
      'authorization': token!
    },
  );
  print(response.body);
  if(response.statusCode == 200){
    print('Charts are fetched');
    final List<dynamic> data = jsonDecode(response.body)['result'];
      return data.map((e) => SectorsChart.fromJson(e)).toList();
  }else{
    throw Exception('Can not fetch charts!');
  }
}