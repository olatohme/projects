// To parse this JSON data, do
//
//     final addition = additionFromJson(jsonString);

import 'dart:convert';

Addition_a  additionFromJson(String str) => Addition_a .fromJson(json.decode(str));

String additionToJson(Addition_a  data) => json.encode(data.toJson());

class Addition_a {
    List<AdditionElement> additions;

    Addition_a({
        required this.additions,
    });

    factory Addition_a .fromJson(Map<String, dynamic> json) => Addition_a (
        additions: List<AdditionElement>.from(json["additions"].map((x) => AdditionElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "additions": List<dynamic>.from(additions.map((x) => x.toJson())),
    };
}

class AdditionElement {
    int id;
    int typeAdditionId;
    String name;
    String description;
    String price;
    String? imageUrl;

    AdditionElement({
        required this.id,
        required this.typeAdditionId,
        required this.name,
        required this.description,
        required this.price,
        required this.imageUrl,
    });

    factory AdditionElement.fromJson(Map<String, dynamic> json) => AdditionElement(
        id: json["id"],
        typeAdditionId: json["type_addition_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type_addition_id": typeAdditionId,
        "name": name,
        "description": description,
        "price": price,
        "image_url": imageUrl,
    };
}

// enum Description {
//     DESCRIPTION_OF_ADDITION_1,
//     DESCRIPTION_OF_ADDITION_2,
//     THIS_IS_ADDITION_1,
//     THIS_IS_ADDITION_2
// }

// final descriptionValues = EnumValues({
//     "Description of Addition 1": Description.DESCRIPTION_OF_ADDITION_1,
//     "Description of Addition 2": Description.DESCRIPTION_OF_ADDITION_2,
//     "this is addition 1": Description.THIS_IS_ADDITION_1,
//     "this is addition 2": Description.THIS_IS_ADDITION_2
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//             reverseMap = map.map((k, v) => MapEntry(v, k));
//             return reverseMap;
//     }
// }
