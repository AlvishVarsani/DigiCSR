class Media{
  String? content;
  String? title;
  String? updateData;
  String? createdDate;
  String? author_name;
  String? author_logo;

  Media(
    {
      this.content,
      this.title,
      this.updateData,
      this.createdDate,
      this.author_name,
      this.author_logo
    }
  );

  factory Media.fromJson(Map<String,dynamic> json){
    return Media(
      content: json['content'],
      title: json['title'],
      updateData: json['updatedAt'],
      createdDate: json['createdAt'],
      author_name: json['author'],
      author_logo: json['ngoLogo']
    );
  }
}