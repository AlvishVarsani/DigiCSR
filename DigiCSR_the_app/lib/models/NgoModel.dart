import 'dart:ffi';

import 'BoardMember.dart';

class Ngo {
  // String? id;
  String? name;
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

  Map<String, dynamic>? profile;

  Ngo({
    // this.id,
    this.name,
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
      // id: json['_id'],
      name: json['NGO_name'],
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
