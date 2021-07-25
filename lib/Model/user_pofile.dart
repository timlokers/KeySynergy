class UserProfile {
  final int id;
  final String name;
  final String lastname;
  final String email;
  final String? phoneId;

  UserProfile({required this.id, required this.name, required this.lastname, required this.email, this.phoneId});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['Id'],
      name: json['Name'],
      lastname: json['Lastname'],
      email: json['Email'],
      phoneId: json['PhoneId'],
    );
  }
}

