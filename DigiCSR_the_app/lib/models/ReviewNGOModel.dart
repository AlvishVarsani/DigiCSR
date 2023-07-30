class ReviewNgo{
  String? ngoid;
  String? companyid;
  String? benificiaryid;
  int? rating;
  String? review;

  ReviewNgo({
    this.ngoid,
    this.companyid,
    this.benificiaryid,
    this.rating,
    this.review
  });

  factory ReviewNgo.fromJson(Map<String, dynamic> json) {
    return ReviewNgo(
      ngoid: json['ngoid'],
      companyid: json['companyReviewer'],
      benificiaryid: json['beneficiaryReviewer'],
      rating: json['rating'],
      review: json['review']
    );
    }
}