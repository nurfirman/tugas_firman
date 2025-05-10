class User {
  final int? id;
  final String? name;
  final String? username;
  final String? role;

  User({this.id, this.name, this.username, this.role});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "role": role,
  };
}