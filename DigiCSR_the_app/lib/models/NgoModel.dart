import 'dart:ffi';

import 'package:digicsr/constants/constants.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'BoardMember.dart';

class Ngo {
  String? id;
  String? ngo_name;
  String? csr;
  int? csr_budget;
  String? email;
  String? summmary;
  int? budget;
  List<dynamic>? sectors = [];
  List<dynamic>? operation_areas = [];
  int? establishment_year; 
  String? phone;
  String? city;
  String? state;
  String? pincode;
  List<dynamic>? board_members = [];
  List<BoardMember>? boardmemberslist;

  Map<String, dynamic>? profile;

  void updatedata(Ngo ngosample){
    this.ngo_name = ngosample.ngo_name;
    this.city = ngosample.city;
    this.boardmemberslist = ngosample.boardmemberslist;
    this.budget = ngosample.budget;
    this.csr = ngosample.csr;
    this.email = ngosample.email;
    this.operation_areas = ngosample.operation_areas;
    this.phone = ngosample.phone;
    this.csr_budget = ngosample.csr_budget;
    this.establishment_year = ngosample.establishment_year;
    this.pincode = ngosample.pincode;
    this.summmary = ngosample.summmary;
    this.sectors = ngosample.sectors;
    this.state = ngosample.state;
    this.board_members = ngosample.board_members;
  }

  Ngo({
    this.id,
    this.ngo_name,
    this.csr,
    this.csr_budget,
    this.email,
    this.profile,
    this.city,
    this.state,
    this.phone,
    this.summmary,
    this.sectors,
    this.pincode,
    this.operation_areas,
    // this.budget,
    this.establishment_year,
    this.board_members
  });

  factory Ngo.fromJson(Map<String, dynamic> json) {
    return Ngo(
      id: json['_id'],
      ngo_name: json['ngo_name'],
      email: json['email'],
      //profile section
      summmary: json['profile']['summary'],
      csr_budget: json['profile']['csr_budget'],
      sectors: json['profile']['sectors'],
      operation_areas: json['profile']['operation_area'],
      establishment_year: json['profile']['establishment_year'],
      phone: json['profile']['phone'],
      //profile->location
      city: json['profile']['location']['city'],
      state: json['profile']['location']['state'],
      pincode: json['profile']['location']['pincode'],
      //profile->board members list
      board_members: json['profile']['board_members']
);
}
}
