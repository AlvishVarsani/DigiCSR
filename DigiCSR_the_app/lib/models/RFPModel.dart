import 'package:digicsr/models/Donations.dart';

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
  List<Donations>? donations;
  List? donation_requests; 

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
     this.donations,
     this.donation_requests
  });

  factory Rfp.fromJson(Map<String, dynamic> json) {
    return Rfp(
      id: json['_id'],
      title: json['title'],
      amount: json['amount'],
      remaining_amount: json['remaining_amount'],
      sectors: json['sectors'],
      states: json['states'],
      timeline: json['timeline'],
      company: json['company'],
      date: json['date'],
      donation_requests: json['donations']
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'title': title,
    'amount': amount,
    'timeline':timeline,
    'sectors': sectors,
    'states': states,
  };
}

