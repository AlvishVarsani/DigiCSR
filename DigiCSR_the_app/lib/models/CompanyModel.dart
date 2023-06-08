class Company {
  final String id;
  final String name;
  final String cin;
  final String email;
  final Map<String, dynamic> profile;
  final List<Map<String, dynamic>> initialData;

  const Company({
    required this.id,
    required this.name,
    required this.cin,
    required this.email,
    required this.profile,
    required this.initialData,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['_id'],
      name: json['company_name'],
      cin: json['cin'],
      email: json['email'],
      profile: json['profile'],
      initialData: json['initialData'],
    );
  }

  Map<String, dynamic> getMap() {
    return {
      "company_name": name,
      "cin": cin,
      "email": email,
      "profile": profile,
      "initialData": initialData
    };
  }
}
