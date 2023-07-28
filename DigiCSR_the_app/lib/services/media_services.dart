import 'package:digicsr/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants/DataLoaders.dart';
import '../models/Media.dart';

Future<List<Media>> getMediaPosts()async{
  String? token = await Token();

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
      print(response.body);
      final List<dynamic> data = jsonDecode(response.body)['postsData'];
      return data.map((e) => Media.fromJson(e)).toList();
    }else{
      throw Exception('Can not fetch the Media Posts!');
    }
}