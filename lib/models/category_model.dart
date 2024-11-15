import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  List<Category> categories;

  Categories({
    required this.categories,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  int id;
  String name;
  int? mainCategory;
  List<Category> subCategory;
  List<Collection> collections;

  Category({
    required this.id,
    required this.name,
    required this.mainCategory,
    required this.subCategory,
    required this.collections,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        mainCategory: json["main category"],
        subCategory: List<Category>.from(json["sub category"].map((x) => Category.fromJson(x))),
        collections: List<Collection>.from(json["collections"].map((x) => Collection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "main category": mainCategory,
        "sub category": List<dynamic>.from(subCategory.map((x) => x.toJson())),
        "collections": List<dynamic>.from(collections.map((x) => x.toJson())),
      };
}

class Collection {
  int id;
  String name;
  List<product> products;

  Collection({
    required this.id,
    required this.name,
    required this.products,
  });

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        id: json["id"],
        name: json["name"],
        products: List<product>.from(json["products"].map((x) => product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class product {
  int id;
  int collectionId;
  String name;
  String price;
  String description;
  int minLevel;
  bool isActive;
  bool inStock;
  bool onSale;
  String? image;
  int? rate;

  product({
    required this.id,
    required this.collectionId,
    required this.name,
    required this.price,
    required this.description,
    required this.minLevel,
    required this.isActive,
    required this.inStock,
    required this.onSale,
    required this.image,
    required this.rate,
  });

  factory product.fromJson(Map<String, dynamic> json) => product(
        id: json["id"],
        collectionId: json["collection_id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
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
        "min_level": minLevel,
        "is_active": isActive,
        "in_stock": inStock,
        "on_sale": onSale,
        "image": image,
        "rate": rate,
      };
}
