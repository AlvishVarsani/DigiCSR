import 'dart:convert';

import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/models/NotificationModel.dart';
import 'package:http/http.dart';

Future<List<NotificationModel>> notifyNGO()async{
  final token = await fetchNGOToken();
  final response = await get(Uri.parse(ipInfo +'/notifications'),
  headers: {
        'Content-Type': 'application/json;charSet=UTF-8',
        'authorization': token!
      }
  );

  print(response.body);
  if(response.statusCode == 200){
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((e) => NotificationModel.fromJson(e)).toList();
  }else{
    // print('Erro in getting notification');
    throw Exception('Error in getting notification');
  }
}