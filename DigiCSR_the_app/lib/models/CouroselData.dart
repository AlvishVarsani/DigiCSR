class CouroselData{
int totalngos = 0;
int totalcompanies = 0;
int totalrfps = 0;

CouroselData({
  this.totalcompanies = 0,
  this.totalngos = 0,
  this.totalrfps = 0
});

factory CouroselData.fromJson(Map<String,dynamic> json){
  return CouroselData(
    totalngos: json['ngos'],
    totalcompanies: json['companies'],
    totalrfps: json['rfps']
  );
}
}

