// To parse this JSON data, do
//
//     final colorsList = colorsListFromJson(jsonString);

import 'dart:convert';

List<ColorsList> colorsListFromJson(String str) => List<ColorsList>.from(json.decode(str).map((x) => ColorsList.fromJson(x)));

String colorsListToJson(List<ColorsList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ColorsList {
    int id;
    String name;
    String hexCode;
    String rgbCode;
    dynamic createdAt;
    dynamic updatedAt;

    ColorsList({
        required this.id,
        required this.name,
        required this.hexCode,
        required this.rgbCode,
        required this.createdAt,
        required this.updatedAt,
    });

    factory ColorsList.fromJson(Map<String, dynamic> json) => ColorsList(
        id: json["id"],
        name: json["name"],
        hexCode: json["hex_code"],
        rgbCode: json["rgb_code"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "hex_code": hexCode,
        "rgb_code": rgbCode,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
