class CouroselData{
int totalngos;
int totalcompanies;
int totalrfps;

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

