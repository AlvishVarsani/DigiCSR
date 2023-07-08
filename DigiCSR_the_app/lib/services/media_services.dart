import 'package:digicsr/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'dart:convert';

import '../models/Media.dart';

Future<List<Media>> getMediaPosts()async{
  String? token = await fetchCompanyToken();

  final response = await http.get(
    Uri.parse(ipInfo + '/media/posts'),
      headers: {
        'Content-Type': 'application/json',
        'authorization': token!
      }
    );
  // print(response.body);
    if(response.statusCode == 200){
      print('Media Posts Fetched');
      print(jsonDecode(response.body)['postsData'][0]['ngoLogo']);
      final List<dynamic> data = jsonDecode(response.body)['postsData'];
      return data.map((e) => Media.fromJson(e)).toList();
    }else{
      throw Exception('Can not fetch the Media Posts!');
    }
}