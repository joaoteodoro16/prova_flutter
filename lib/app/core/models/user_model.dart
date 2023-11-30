import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {

  final String id;
  final String name;
  final String username;
  final DateTime  createdAt;
  final String password;
  
  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.createdAt,
    required this.password,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      username: map['username'] as String,
      createdAt: DateTime.parse(map['createdAt']),
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
