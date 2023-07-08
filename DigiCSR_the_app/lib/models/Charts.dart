class Chart{
  String? id;
  int? totalamount;

  Chart(
    {
      this.id,
      this.totalamount
    }
  );

  factory Chart.fromJson(Map<String,dynamic> json){
    return Chart(
      id: json['_id'],
      totalamount: json['totalAmount']
    );
  }
}