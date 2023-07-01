import 'dart:convert';
import 'dart:io';

import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/models/NgoModel.dart';

import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http_parser/src/media_type.dart';

Future<List<Ngo>> getAllNgos()async{
  String? token = await fetchBenificiaryToken();

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