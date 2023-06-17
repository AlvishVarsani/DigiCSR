import 'package:flutter/foundation.dart';

class Rfp {
  String? id;
  String? title;
  int? amount;
  int? remaining_amount;
  List? sectors = [];
  List? states = [];
  String? timeline;
  String? company;
  String? date;

  Rfp({
     this.id,
     this.title,
     this.amount,
     this.remaining_amount,
     this.timeline,
     this.company,
     this.date ,
     this.sectors,
     this.states,
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

