// To parse this JSON data, do
//
//     final userComments = userCommentsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<UserComments> userCommentsFromJson(String str) => List<UserComments>.from(json.decode(str).map((x) => UserComments.fromJson(x)));

String userCommentsToJson(List<UserComments> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserComments {
    final int postId;
    final int id;
    final String name;
    final String email;
    final String body;

    UserComments({
        required this.postId,
        required this.id,
        required this.name,
        required this.email,
        required this.body,
    });

    factory UserComments.fromJson(Map<String, dynamic> json) => UserComments(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
    };
}
