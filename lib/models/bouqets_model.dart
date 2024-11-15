import 'dart:convert';

Bouquets bouquetsFromJson(String str) => Bouquets.fromJson(json.decode(str));

String bouquetsToJson(Bouquets data) => json.encode(data.toJson());

class Bouquets {
    List<Bouquet> bouquets;

    Bouquets({
        required this.bouquets,
    });

    factory Bouquets.fromJson(Map<String, dynamic> json) => Bouquets(
        bouquets: List<Bouquet>.from(json["bouquets"].map((x) => Bouquet.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "bouquets": List<dynamic>.from(bouquets.map((x) => x.toJson())),
    };
}

class Bouquet {
    int id;
    String name;
    String totalPrice;
    List<Product> products;
    Color color;
    Design design;
    List<Addition> additions;

    Bouquet({
        required this.id,
        required this.name,
        required this.totalPrice,
        required this.products,
        required this.color,
        required this.design,
        required this.additions,
    });

    factory Bouquet.fromJson(Map<String, dynamic> json) => Bouquet(
        id: json["id"],
        name: json["name"],
        totalPrice: json["total_price"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        color: Color.fromJson(json["color"]),
        design: Design.fromJson(json["design"]),
        additions: List<Addition>.from(json["additions"].map((x) => Addition.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "total_price": totalPrice,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "color": color.toJson(),
        "design": design.toJson(),
        "additions": List<dynamic>.from(additions.map((x) => x.toJson())),
    };
}

class Product {
    int id;
    int productId;
    String productName;
    int quantity;
    List<String> size;

    Product({
        required this.id,
        required this.productId,
        required this.productName,
        required this.quantity,
        required this.size,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productId: json["product_id"],
        productName: json["product_name"],
        quantity: json["quantity"],
        size: List<String>.from(json["size"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "product_name": productName,
        "quantity": quantity,
        "size": List<dynamic>.from(size.map((x) => x)),
    };
}

class Color {
    int id;
    String name;
    String rgbCode;

    Color({
        required this.id,
        required this.name,
        required this.rgbCode,
    });

    factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json["id"],
        name: json["name"],
        rgbCode: json["rgb_code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rgb_code": rgbCode,
    };
}

class Design {
    int id;
    String name;
    String description;
    String image;

    Design({
        required this.id,
        required this.name,
        required this.description,
        required this.image,
    });

    factory Design.fromJson(Map<String, dynamic> json) => Design(
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

class Addition {
    int id;
    int typeAdditionId;
    String name;
    String description;
    String price;
    String imageUrl;

    Addition({
        required this.id,
        required this.typeAdditionId,
        required this.name,
        required this.description,
        required this.price,
        required this.imageUrl,
    });

    factory Addition.fromJson(Map<String, dynamic> json) => Addition(
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
