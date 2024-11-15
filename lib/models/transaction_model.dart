// To parse this JSON data, do
//
//     final transaction = transactionFromJson(jsonString);

import 'dart:convert';

List<Transaction> transactionFromJson(String str) => List<Transaction>.from(json.decode(str).map((x) => Transaction.fromJson(x)));

String transactionToJson(List<Transaction> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Transaction {
    int id;
    int userId;
    int points;
    String type;
    String description;
    DateTime createdAt;
    DateTime updatedAt;

    Transaction({
        required this.id,
        required this.userId,
        required this.points,
        required this.type,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        userId: json["user_id"],
        points: json["points"],
        type: json["type"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "points": points,
        "type": type,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
