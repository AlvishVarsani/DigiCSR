import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../models/RFPModel.dart';

void addRFP(Map<String,dynamic> body) async {
  final token = await fetchToken();

  var client = new http.Client();
client.post(Uri.parse(ipInfo + "/add-rfp"), body: json.encode(body),
headers: {
    'Context-Type': 'application/json;charSet=UTF-8',
    'authorization': token!
  },
).then((response) {
  client.close();
  print(response.body);
  if (response.statusCode == 200) {
     //enter your code for change state
     print('Raised');
  }
}).catchError((onError) {
   client.close();
   print("Error: $onError");
});
}
  // final response = await http.post(Uri.parse(ipInfo + "/add-rfp"),
  // headers: {
  //   'Context-Type': 'application/json;charSet=UTF-8',
  //   'authorization': token!
  // },
  // body: json.encoder.convert(body)
  // );
  // print(response.body);
  // if (response.statusCode == 200) {
  //   print(response.body);
  // } else {
  //   throw Exception('Failed to put RFP data');
  // }

Future<List<Rfp>> fetchAllRfp() async {
  // fetch the token
  final token = await storage.read(key: "ngo");

  final response = await http.get(Uri.parse(ipInfo + "/rfps"), 
  headers: {
    'Context-Type': 'application/json;charSet=UTF-8',
    'authorization': token!
  });

  print(response.body);

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((e) => Rfp.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load RFP data');
  }
}

Future<List<Rfp>> fetchCompanyRfp() async {
  final token = await fetchToken();
  final response =
      // await http.get(Uri.parse(ipInfo + "/company/rfp" + "?id=$id"));
      await http.get(Uri.parse(ipInfo + "/company/rfp"),
      headers: {
        'Context-Type': 'application/json;charSet=UTF-8',
        'authorization': token!
      }
      );
// print(jsonDecode(response.body));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    print(data);
    return data.map((e) => Rfp.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load RFP data');
  }
}


//NGO accept the praposal
void acceptPraposal(Map<dynamic,dynamic> data)async{
  final token = await fetchNGOToken();
  var client = new http.Client();
client.put(Uri.parse(ipInfo + "/accept-rfp"), body: jsonEncode(data),
headers: {
    'Context-Type': 'application/json',
    'authorization': token!
  },
).then((response) {
  client.close();
  print(response.body);
  if (response.statusCode == 200) {
     //enter your code for change state
     print('Request send.');
  }
}).catchError((onError) {
   client.close();
   print("Error: $onError");
});
}