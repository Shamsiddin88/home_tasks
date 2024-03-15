class UsersModel {
  final int id;
  final String username;
  final String name;
  final String state;
  final String avatarUrl;

  UsersModel({
    required this.id,
    required this.username,
    required this.name,
    required this.state,
    required this.avatarUrl,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json['id'] as int? ?? 0,
      username: json['username'] as String? ?? "",
      name: json['name'] as String? ?? "",
      state: json['state'] as String? ?? "",
      avatarUrl: json['avatar_url'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'name': name,
      'state': state,
      'avatar_url': avatarUrl,
    };
  }
}