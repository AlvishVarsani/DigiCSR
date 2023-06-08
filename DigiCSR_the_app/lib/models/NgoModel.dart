class Ngo {
  final String id;
  final String name;
  final String csr;
  final String email;
  final Map<String, dynamic> profile;

  const Ngo({
    required this.id,
    required this.name,
    required this.csr,
    required this.email,
    required this.profile,
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
