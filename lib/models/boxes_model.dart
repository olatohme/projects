// To parse this JSON data, do
//
//     final boxes = boxesFromJson(jsonString);

import 'dart:convert';

Boxes boxesFromJson(String str) => Boxes.fromJson(json.decode(str));

String boxesToJson(Boxes data) => json.encode(data.toJson());

class Boxes {
    List<Box> boxes;

    Boxes({
        required this.boxes,
    });

    factory Boxes.fromJson(Map<String, dynamic> json) => Boxes(
        boxes: List<Box>.from(json["boxes"].map((x) => Box.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "boxes": List<dynamic>.from(boxes.map((x) => x.toJson())),
    };
}

class Box {
    int id;
    String name;
    String description;
    String image;

    Box({
        required this.id,
        required this.name,
        required this.description,
        required this.image,
    });

    factory Box.fromJson(Map<String, dynamic> json) => Box(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
    };
}
