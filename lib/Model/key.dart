class Key {
  final int id;
  final int keyId;
  final String keyName;
  final String description;
  final int userProfileId;

  Key(
      {required this.id,
      required this.keyId,
      required this.keyName,
      required this.description,
      required this.userProfileId});

  factory Key.fromJson(Map<String, dynamic> json) {
    return Key(
      id: json['id'],
      keyId: json['keyId'],
      keyName: json['keyName'],
      description: json['description'],
      userProfileId: json['userProfileId'],
    );
  }
}
