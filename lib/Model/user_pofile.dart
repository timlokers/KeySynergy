class UserProfile {
  int id;
  String name;
  String lastname;
  String email;
  String phoneId;

  UserProfile(
      {required this.id,
      required this.name,
      required this.lastname,
      required this.email,
      required this.phoneId});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      name: json['name'],
      lastname: json['lastname'],
      email: json['email'],
      phoneId: json['phoneId'],
    );
  }
}
