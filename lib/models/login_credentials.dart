// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginCredentials {
  final String email;
  final String token;
  LoginCredentials({
    required this.email,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'token': token,
    };
  }

  factory LoginCredentials.fromMap(Map<String, dynamic> map) {
    return LoginCredentials(
      email: map['email'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginCredentials.fromJson(String source) =>
      LoginCredentials.fromMap(json.decode(source) as Map<String, dynamic>);
}
