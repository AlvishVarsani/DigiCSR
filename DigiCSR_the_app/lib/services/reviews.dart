import 'dart:convert';

import 'package:digicsr/constants/DataLoaders.dart';
import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/models/ReviewNGOModel.dart';
import 'package:http/http.dart' as http;

Future Review(Map<String,dynamic> data) async {
  print('Review Function Called');
  String? token = await Token();
  final response = await http.post(
    Uri.parse(ipInfo + "/add-review"),
    headers: {
      'Content-Type': 'application/json;charSet=UTF-8',
      'authorization': token!
    },
    body: jsonEncode(data)
  );
  print(response.body);
  if(response.statusCode == 200){
    print("Reciew Submitted Successfully!");
  }
  else{
    throw Exception(jsonDecode(response.body)['message']);
  }
}

Future<List<ReviewNgo>> getReview(String ngoid)async{
  String? token = await Token();
  final response = await http.get(
    Uri.parse(ipInfo + "/get-reviews/${ngoid}"),
    headers: {
      'Content-Type': 'application/json;charSet=UTF-8',
      'authorization': token!
    }
    );
    print(response.body);
if(response.statusCode == 200){
  print('Review fetched!');
  final List<dynamic> data = jsonDecode(response.body)['reviews'];
    return data.map((e) => ReviewNgo.fromJson(e)).toList();
}else{
  throw Exception(jsonDecode(response.body)['message']);
}

}


