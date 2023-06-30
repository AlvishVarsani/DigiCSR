class BoardMember{
  String? bm_name;
  String? bm_gender;
  String? bm_din;
  String? bm_phone;
  String? bm_designation;

  BoardMember({
    this.bm_name,
    this.bm_designation,
    this.bm_din,
    this.bm_gender,
    this.bm_phone
  });

  factory BoardMember.fromJson(Map<String, dynamic> json){
    return BoardMember(
      bm_name: json['bm_name'],
      bm_phone: json['bm_phone'],
      bm_din: json['bm_din'],
      bm_gender: json['bm_gender'],
      bm_designation: json['bm_designation']
    );
  }

}