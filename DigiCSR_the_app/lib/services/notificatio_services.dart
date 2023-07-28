import 'dart:convert';

import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/models/NotificationModel.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../constants/DataLoaders.dart';

Future<List<NotificationModel>> notify()async{
  String? token = await Token();
  final response = await http.get(Uri.parse(ipInfo +'/notifications'),
  headers: {
        'Content-Type': 'application/json;charSet=UTF-8',
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
    throw Exception('No notifications found!');
  }
  
}

Future updateNotification(String notifiId)async{
  String? token = await Token();
 final response = await http.post(
  Uri.parse(ipInfo + '/notifications/updatestatus'),
  headers: {
      'authorization': token.toString()
    },
    body: {
      'notificationID': notifiId
    }
 );

 if(response.statusCode == 200){
    print('Notification is updated successfully!');
  }else{
    throw Exception('Error while updating notification!');
  }
}

Future deleteNotification(String notifiId)async{
  String? token = await Token();
  final response = await http.delete(
    Uri.parse(ipInfo + '/notifications/delete'),
    headers: {
      'authorization': token.toString()
    },
    body: {
      'notificationID': notifiId
    }
  );

  if(response.statusCode == 200){
    print('Notification is deleted successfully!');
  }else{
    throw Exception('Error while deleting notification!');
  }
}

Future deleteAll(List<NotificationModel> n)async{
  try {
    for(int i = 0;i<n.length;i++){
    await deleteNotification(n[i].notificationID!);
  }
  } catch (e) {
    throw Exception('Can\'t delete notifications now!');
  }
}

Future markAllRead(List<NotificationModel> n)async{
  try {
    for(int i = 0;i<n.length;i++){
    await updateNotification(n[i].notificationID!);
  }
  } catch (e) {
    throw Exception('Unable to mark all notifications as read!');
  }
}