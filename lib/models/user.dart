// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.online,
    this.email,
    this.nombre,
    this.uid,
  });

  bool online;
  String email;
  String nombre;
  String uid;

  factory User.fromJson(Map<String, dynamic> json) => User(
        online: json["online"],
        email: json["email"],
        nombre: json["nombre"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "online": online,
        "email": email,
        "nombre": nombre,
        "uid": uid,
      };
}
