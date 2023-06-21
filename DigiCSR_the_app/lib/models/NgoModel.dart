class Ngo {
  String? id;
  String? name;
  String? csr;
  String? email;
  Map<String, dynamic>? profile;

  Ngo({
    this.id,
    this.name,
    this.csr,
    this.email,
    this.profile,
  });

  factory Ngo.fromJson(Map<String, dynamic> json) {
    return Ngo(
      id: json['_id'],
      name: json['NGO_name'],
      csr: json['csr'],
      email: json['email'],
      profile: json['profile'],
    );
  }
}
