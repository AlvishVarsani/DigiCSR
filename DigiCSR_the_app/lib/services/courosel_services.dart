import 'dart:convert';
import 'package:digicsr/constants/constants.dart';

import 'package:http/http.dart' as http;

import '../models/CouroselData.dart';

Future<CouroselData> getCouroselData()async{
  final response = await http.get(Uri.parse(ipInfo + '/charts/courosel'),
    headers: {
        'Content-Type': 'application/json;charSet=UTF-8',
      }
  );
  print(response.body);
  if(response.statusCode == 200){
    return CouroselData.fromJson(jsonDecode(response.body)['data']);
  }
  else{
    throw Exception('Can not load courosel data');
  }
}