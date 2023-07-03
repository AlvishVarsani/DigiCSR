import 'dart:convert';

import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/models/NotificationModel.dart';
import 'package:http/http.dart';

Future<List<NotificationModel>> notify()async{
<<<<<<< HEAD
  String? token = await fetchCompanyToken();
=======
  String? token = await fetchNGOToken();
>>>>>>> 1c8c9bb4b07b6024bcc5d439d589506b09b60af5
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