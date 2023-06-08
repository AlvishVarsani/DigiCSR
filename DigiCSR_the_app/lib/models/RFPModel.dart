import 'package:flutter/foundation.dart';

class Rfp {
  final String id;
  final String title;
  final int amount;
  final List<dynamic> sectors;
  final List<dynamic> states;
  final String timeline;
  final String company;

  const Rfp({
    required this.id,
    required this.title,
    required this.amount,
    required this.sectors,
    required this.states,
    required this.timeline,
    required this.company,
  });

  factory Rfp.fromJson(Map<String, dynamic> json) {
    return Rfp(
      id: json['_id'],
      title: json['title'],
      amount: json['amount'],
      sectors: json['sectors'],
      states: json['states'],
      timeline: json['timeline'],
      company: json['company_name'],
    );
  }

}
