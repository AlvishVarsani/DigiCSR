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

  static List<BoardMember> givelist(List<dynamic>? list){
    List<BoardMember> boardmemberlist = [];
    for(int i = 0;i<list!.length;i++){
      boardmemberlist.add(BoardMember(
      bm_name: list[i]['bm_name'],
      bm_phone: list[i]['bm_phone'],
      bm_din: list[i]['bm_din'],
      bm_gender: list[i]['bm_gender'],
      bm_designation: list[i]['bm_designation']
    ));
    }
    return boardmemberlist;
  }

}