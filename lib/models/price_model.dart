import 'dart:convert';
Temperatures priceFromJson(String str) => Temperatures.fromJson(json.decode(str));

String priceToJson(Temperatures data) => json.encode(data.toJson());
class Temperatures {
  String success;
  int price;

  Temperatures({
    required this.success,
    required this.price,
  });

  factory Temperatures.fromRawJson(String str) => Temperatures.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Temperatures.fromJson(Map<String, dynamic> json) => Temperatures(
    success: json["success"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "price": price,
  };
}