import 'dart:convert';

import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/models/NotificationModel.dart';
import 'package:http/http.dart';

Future<List<NotificationModel>> notify()async{
  String? token = await fetchNGOToken();
  final response = await get(Uri.parse(ipInfo +'/notifications'),
  headers: {
        'Context-Type': 'application/json;charSet=UTF-8',
        'authorization': token.toString()
      }
  );

  print(response.body);
  if(response.statusCode == 200){
    final List<dynamic> data = jsonDecode(response.body)['notifications'];
    List<NotificationModel> notificationlist = data.map((e) => NotificationModel.fromJson(e)).toList();
    unread_notification = notificationlist.any((element) => !element.read!);
    return data.map((e) => NotificationModel.fromJson(e)).toList();
  }else{
    // print('Erro in getting notification');
    throw Exception('Error in getting notification');
  }
}