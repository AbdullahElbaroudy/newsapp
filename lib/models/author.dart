// To parse this JSON data, do
//
//     final author = authorFromJson(jsonString);

import 'dart:convert';

Author authorFromJson(String str) => Author.fromJson(json.decode(str));

String authorToJson(Author data) => json.encode(data.toJson());

class Author {
  String id;
  String name;
  String email;
  String apiToken;
  String avatar;
  DateTime emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;

  Author({
    this.id,
    this.name,
    this.email,
    this.apiToken,
    this.avatar,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    apiToken: json["api_token"],
    avatar: json["avatar"],
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "api_token": apiToken,
    "avatar": avatar,
    "email_verified_at": emailVerifiedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
