import 'package:flutter/foundation.dart';

class Rfp {
  final String? id;
  final String? title;
  final int? amount;
  final int? remaining_amount;
  final List<dynamic>? sectors;
  final List<dynamic>? states;
  final String? timeline;
  final String? company;

  const Rfp({
     this.id,
     this.title,
     this.amount,
     this.remaining_amount,
     this.sectors,
     this.states,
     this.timeline,
     this.company,
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
