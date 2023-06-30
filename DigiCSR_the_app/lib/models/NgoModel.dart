import 'BoardMember.dart';

class Ngo {
  String? id;
  String? name;
  String? csr;
  String? csr_budget;
  String? email;
  String? summmary;
  int? budget;
  List<String>? sectors = [];
  List<String>? operation_areas = [];
  int? establishment_year; 
  String? phone;
  String? city;
  String? states;
  String? pincode;
  String? bm_name;
  String? bm_gender;
  String? bm_din;
  String? bm_phone;
  String? bm_designation;
  List<BoardMember>? board_members = [];

  Map<String, dynamic>? profile;

  Ngo({
    this.id,
    this.name,
    this.csr,
    this.csr_budget,
    this.email,
    this.profile,
    this.city,
    this.states,
    this.phone,
    this.summmary,
    this.sectors,
    this.pincode,
    this.operation_areas,
    this.budget,
    this.establishment_year,
    this.bm_phone,
    this.bm_name,
    this.bm_gender,
    this.bm_din,
    this.bm_designation,
    this.board_members
  });

  factory Ngo.fromJson(Map<String, dynamic> json) {
    return Ngo(
      id: json['_id'],
      name: json['NGO_name'],
      csr_budget: json['csr_budget'],
      email: json['email'],
      summmary: json['summary'],
      budget: json['budget'],
      sectors: json['sectors'],
      operation_areas: json['operation_areas'],
      establishment_year: json['establishment_year'],
      phone: json['phone'],
      city: json['city'],
      states: json['states'],
      pincode: json['pincode'],
      board_members: json['board_members']
);
}
}
