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
  List<Donation>? donations;

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
     this.donations
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
      date: json['date'],
      donations: json['donations'].map((donation) => Donation.fromJson(donation)).toList()
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

class Donation {
  final String id;
  final String nogId;
  final String ngo;
  final int amount;
  final DateTime date;
  final String status;

  Donation({required this.id, required this.nogId, required this.ngo, required this.amount, required this.date, required this.status});

  // factory method to create a donation object from a map
  factory Donation.fromJson(Map<String, dynamic> json) {
    return Donation(
      id: json['_id'],
      nogId: json['nogId'],
      ngo: json['ngo'],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
      status: json['status']
    );
  }
}



