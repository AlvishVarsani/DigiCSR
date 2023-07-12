class Chart{
  int? id;
  String? sectors;
  int? totalamount;

  Chart(
    {
      this.id,
      this.totalamount,
      this.sectors
    }
  );

  factory Chart.fromJson(Map<String,dynamic> json){
    return Chart(
      id: json['_id'],
      sectors: json['sectors'],
      totalamount: json['totalAmount']
    );
  }
}


class SectorsChart{
  String? id;
  int? totalamount;

  SectorsChart(
    {
      this.id,
      this.totalamount,
    }
  );

  factory SectorsChart.fromJson(Map<String,dynamic> json){
    return SectorsChart(
      id: json['_id'],
      totalamount: json['totalAmount']
    );
  }
}