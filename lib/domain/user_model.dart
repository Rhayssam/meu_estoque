import 'dart:convert';
import 'package:equatable/equatable.dart';

final class UserModel extends Equatable {
  const UserModel({
    required this.uuid,
    required this.email,
    required this.name,
    required this.token,
  });

  final String uuid;
  final String email;
  final String name;
  final String token;

  UserModel copyWith({
    String? uuid,
    String? email,
    String? name,
    String? token,
  }) {
    return UserModel(
      uuid: uuid ?? this.uuid,
      email: email ?? this.email,
      name: name ?? this.name,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'email': email,
      'name': name,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uuid: map['uuid'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uuid: $uuid, email: $email, name: $name,)';
  }

  @override
  List<Object?> get props {
    return [
      uuid,
      email,
      name,
      token,
    ];
  }
}
