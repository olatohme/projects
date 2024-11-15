// To parse this JSON data, do
//
//     final flowers = flowersFromJson(jsonString);

import 'dart:convert';

Flowers flowersFromJson(String str) => Flowers.fromJson(json.decode(str));

String flowersToJson(Flowers data) => json.encode(data.toJson());

class Flowers {
    List<Product_flo> products;

    Flowers({
        required this.products,
    });

    factory Flowers.fromJson(Map<String, dynamic> json) => Flowers(
        products: List<Product_flo>.from(json["products"].map((x) => Product_flo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product_flo {
    int id;
    int collectionId;
    String name;
    String price;
    String description;
    dynamic size;
    int? minLevel;
    bool isActive;
    bool inStock;
    bool onSale;
    String? image;
    int rate;

    Product_flo({
        required this.id,
        required this.collectionId,
        required this.name,
        required this.price,
        required this.description,
        required this.size,
        required this.minLevel,
        required this.isActive,
        required this.inStock,
        required this.onSale,
        required this.image,
        required this.rate,
    });

    factory Product_flo.fromJson(Map<String, dynamic> json) => Product_flo(
        id: json["id"],
        collectionId: json["collection_id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        size: json["size"],
        minLevel: json["min_level"],
        isActive: json["is_active"],
        inStock: json["in_stock"],
        onSale: json["on_sale"],
        image: json["image"],
        rate: json["rate"]?? 0,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "collection_id": collectionId,
        "name": name,
        "price": price,
        "description": description,
        "size": size,
        "min_level": minLevel,
        "is_active": isActive,
        "in_stock": inStock,
        "on_sale": onSale,
        "image": image,
        "rate": rate,
    };
}
