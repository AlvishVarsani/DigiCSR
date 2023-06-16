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
  final String? date;

  const Rfp({
     this.id,
     this.title,
     this.amount,
     this.remaining_amount,
     this.sectors,
     this.states,
     this.timeline,
     this.company,
     this.date
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
      date: json['date']
    );
  }

  // factor Rfp.toJson(){

  // }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'title': title,
    'amount': amount,
    'timeline':timeline,
    'sectors': sectors,
    'states': states,
  };
}

