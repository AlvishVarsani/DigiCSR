import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

import '../constants/DataLoaders.dart';
import '../constants/constants.dart';
import '../models/RFPModel.dart';

Future addRFP(var data) async {
  final token = await Token();

final response = await http.post(Uri.parse(ipInfo + "/add-rfp"),
headers: {
  'Content-Type': 'application/json;charSet=UTF-8',
  'authorization': token!
},
body: jsonEncode(data)
);
print(response.body);
if (response.statusCode == 200) {
  print(response.body);
} else {
  throw Exception('Failed to put RFP data');
}

}


Future<List<Rfp>> fetchAllRfp() async {
  // fetch the token
  String? token = await Token();

  final response = await http.get(Uri.parse(ipInfo + "/rfps"), headers: {
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

Future<Rfp> fetchRfpDetails(String rfpid)async{
  final token = await Token();
  final response =
      // await http.get(Uri.parse(ipInfo + "/company/rfp" + "?id=$id"));
      await http.get(Uri.parse(ipInfo + "/rfp/${rfpid}"), headers: {
    'Content-Type': 'application/json',
    'authorization': token.toString()
  });
  // print(jsonDecode(response.body));

  if (response.statusCode == 200) {
    print(response.body);
    final data = jsonDecode(response.body);
    return Rfp.fromJson(data['rfp']);
  } else {
    throw Exception('Failed to load RFP data');
  }
}

Future<List<Rfp>> fetchCompanyRfp() async {
  final token = await Token();
  final response =
      // await http.get(Uri.parse(ipInfo + "/company/rfp" + "?id=$id"));
      await http.get(Uri.parse(ipInfo + "/company/rfp"), headers: {
    'Content-Type': 'application/json',
    'authorization': token.toString()
  });
  print(jsonDecode(response.body));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    print(data);
    return data.map((e) => Rfp.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load RFP data');
  }
}

//NGO accept the praposal
Future acceptPraposal(Map<dynamic, dynamic> data) async {
  final token = await Token();
  var client = new http.Client();
  client.put(
    Uri.parse(ipInfo + "/accept-rfp"),
    body: jsonEncode(data),
    headers: {'Content-Type': 'application/json', 'authorization': token!},
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

Future<Rfp> donationReq() async {
  final token = await Token();
  Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
  String id = decodedToken['_id'];
  final response = await http.get(Uri.parse(ipInfo + "/rfp/$id"), 
  headers: {
    'Content-Type': 'application/json;charSet=UTF-8',
    'authorization': token
  });
  
  print(response.body);
  if(response.statusCode == 200){
    print('Donation Request arises.');
    final Map<String, dynamic> data = jsonDecode(response.body)['rfp'];
    return Rfp.fromJson(data);
  }else{
    throw Exception('Error in getting the donation requests from NGO.');
  }
}

Future<int> manage_donations(Map<String, dynamic> data)async{
  String? token = await Token();
  final response = await http.put(
    Uri.parse(ipInfo + '/rfp/manage'),
    headers: {
    'Content-Type': 'application/json',
    'authorization': token!
    },
    body: jsonEncode(data)
    );
    print(jsonDecode(response.body));
    return response.statusCode;
    // if(response.statusCode == 200){
    //   print('Action executed successfully!');
    // }else{
    //   throw Exception('Action executed unsuccessfully.');
    // }
}

Future deleteRfp(String rfpid)async{
  String? token = await Token();
  final response = await http.delete(
    Uri.parse(ipInfo + '/rfp/delete/${rfpid}'),
    headers: {
    'Content-Type': 'application/json',
    'authorization': token!
    },
    );

    if(response.statusCode == 200){
      print('Rfp deleted!');
    }else{
      throw Exception('Rfp can not be deleted!');
    }
}
