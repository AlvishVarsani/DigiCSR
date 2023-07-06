import 'NgoModel.dart';

class Donations{
  String? donation_id;
  String? ngo_id;
  String? requested_ngo_name;
  int? requested_amount;
  String? requested_date;
  String? status;

  Donations({
    this.donation_id,
    this.ngo_id,
    this.requested_ngo_name,
    this.requested_amount,
    this.requested_date,
    this.status
  });

  factory Donations.fromJson(Map<String,dynamic> json){
    return Donations(
      donation_id: json['_id'],
      ngo_id: json['nogId'],
      requested_ngo_name: json['ngo'],
      requested_amount: json['amount'],
      requested_date: json['date'],
      status: json['status']
    );
  }

    static List<Donations> giveDonationslist(List<dynamic>? list){
    List<Donations>? donationslist = [];
    for(int i = 0;i<list!.length;i++){
      donationslist.add(Donations(
      donation_id: list[i]['_id'],
      ngo_id: list[i]['nogId'],
      requested_ngo_name: list[i]['ngo'],
      requested_amount: list[i]['amount'],
      requested_date: list[i]['date'],
      status: list[i]['status'],
    ));
    }
    return donationslist;
  }
}