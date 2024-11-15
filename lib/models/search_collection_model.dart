// To parse this JSON data, do
//
//     final searchCollection = searchCollectionFromJson(jsonString);

import 'dart:convert';

SearchCollection searchCollectionFromJson(String str) => SearchCollection.fromJson(json.decode(str));

String searchCollectionToJson(SearchCollection data) => json.encode(data.toJson());

class SearchCollection {
    List<Collection_search> collections;

    SearchCollection({
        required this.collections,
    });

    factory SearchCollection.fromJson(Map<String, dynamic> json) => SearchCollection(
        collections: List<Collection_search>.from(json["collections"].map((x) => Collection_search.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "collections": List<dynamic>.from(collections.map((x) => x.toJson())),
    };
}

class Collection_search {
    int id;
    String name;
    List<Product_search> products;

    Collection_search({
        required this.id,
        required this.name,
        required this.products,
    });

    factory Collection_search.fromJson(Map<String, dynamic> json) => Collection_search(
        id: json["id"],
        name: json["name"],
        products: List<Product_search>.from(json["products"].map((x) => Product_search.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product_search{
    int id;
    int collectionId;
    String name;
    String price;
    String description;
    List<String>? size;
    int minLevel;
    bool isActive;
    bool inStock;
    bool onSale;
    String? image;
    int? rate;

    Product_search({
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

    factory Product_search.fromJson(Map<String, dynamic> json) => Product_search(
        id: json["id"],
        collectionId: json["collection_id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        size: json["size"] == null ? [] : List<String>.from(json["size"]!.map((x) => x)),
        minLevel: json["min_level"],
        isActive: json["is_active"],
        inStock: json["in_stock"],
        onSale: json["on_sale"],
        image: json["image"],
        rate: json["rate"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "collection_id": collectionId,
        "name": name,
        "price": price,
        "description": description,
        "size": size == null ? [] : List<dynamic>.from(size!.map((x) => x)),
        "min_level": minLevel,
        "is_active": isActive,
        "in_stock": inStock,
        "on_sale": onSale,
        "image": image,
        "rate": rate,
    };
}
