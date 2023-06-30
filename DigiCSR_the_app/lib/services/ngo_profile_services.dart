import 'dart:convert';
import 'dart:io';

import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/models/NgoModel.dart';

import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http_parser/src/media_type.dart';


void AddNgoProfile()async{
  String? token = await fetchNGOToken();
  print(token);

  var request = http.MultipartRequest('POST', Uri.parse(ipInfo + '/NGO/add-profile'),);
  print(company.tax_comp);
  // print(tax_comp);
  // int? establishment_year = company.establishment_year;

// request.headers["Content-Type"] = "multipart/form-data";
request.headers["authorization"] = token.toString();

request.fields['ngo_name'] = ngo.name!;
request.fields['summary'] = ngo.summmary!;
request.fields['city'] = ngo.city!;
request.fields['state'] = ngo.state!;
request.fields['pincode'] = company.pincode!;
request.fields['establishment_year'] = company.establishment_year.toString();
request.fields['phone'] = ngo.phone!;
request.fields['csr_budget'] = ngo.csr_budget.toString();

for (var index = 0; index < ngo.board_members!.length; index++) {
    var member = ngo.board_members![index];
    request.fields['board_members[$index][bm_name]'] = member.bm_name!;
    request.fields['board_members[$index][bm_gender]'] = member.bm_gender!;
    request.fields['board_members[$index][bm_din]'] = member.bm_din!;
    request.fields['board_members[$index][bm_phone]'] = member.bm_phone!;
    request.fields['board_members[$index][bm_designation]'] =
        member.bm_designation!;
  }

for (int i = 0; i < ngo.operation_areas!.length; i++) {
  request.files.add(http.MultipartFile.fromString("operation_area[$i]", ngo.operation_areas![i], contentType: MediaType("application", "json")));
}

for (int i = 0; i < ngo.sectors!.length; i++) {
  request.files.add(http.MultipartFile.fromString("sectors[$i]", ngo.sectors![i], contentType: MediaType("application", "json")));
}


var response = await request.send();
 response.stream.transform(utf8.decoder).listen((data) {
      print(data);
    });

if (response.statusCode == 200) {
  // The request was successful
  print('Uploaded!');
} else {
  // The request failed
  print('Failed!');
}
}

Future<Ngo> fetchNgoProfile() async {
  String? token = await fetchNGOToken();
  Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
  String id = decodedToken['_id'];

  var response = await http.get(
    Uri.parse(ipInfo + "/NGO/profile/${id}"),
    headers: {
        'Content-Type': 'application/json;charSet=UTF-8',
        'authorization': token
      }
  );
  print(response.body);
  if (response.statusCode == 200) {
    return Ngo.fromJson(jsonDecode(response.body)['data']);
  } else {
    throw Exception("Something went wrong");
  }
}

Future<void> updateNgoProfile(
    String id, Map<String, String> updatedData, File image) async {
  String? token = await fetchCompanyToken();

  var request = http.MultipartRequest(
    'POST',
    Uri.parse(ipInfo + "/NGO/add-profile/$id"),
  );

  request.headers[HttpHeaders.authorizationHeader] = "Bearer $token";
  request.fields.addAll(updatedData);
  request.files.add(
    http.MultipartFile.fromBytes('file', File(image.path).readAsBytesSync(),
        filename: image.path),
  );

  await request.send();
}
