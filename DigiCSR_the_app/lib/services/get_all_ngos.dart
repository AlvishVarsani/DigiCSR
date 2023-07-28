import 'dart:convert';
import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/models/NgoModel.dart';

import 'package:http/http.dart' as http;

import '../constants/DataLoaders.dart';

Future<List<Ngo>> getAllNgos()async{
  String? token = await Token();

  final response = await http.get(
    Uri.parse(ipInfo + "/NGO"),
    headers: {
        'Content-Type': 'application/json;charSet=UTF-8',
        'authorization': token!
      });

      print(response.body);
      if(response.statusCode == 200){
        final List<dynamic> data = jsonDecode(response.body)['ngos'];
        return data.map((e) => Ngo.fromJson(e)).toList();
      }else{
        throw Exception('Can not get Ngos');
      }
}