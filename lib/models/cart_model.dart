import 'dart:convert';

Temperatures cartFromJson(String str) => Temperatures.fromJson(json.decode(str));
String cartToJson(Temperatures data) => json.encode(data.toJson());

class Temperatures {
  MyCart myCart;

  Temperatures({
    required this.myCart,
  });

  factory Temperatures.fromRawJson(String str) => Temperatures.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());

  factory Temperatures.fromJson(Map<String, dynamic> json) => Temperatures(
    myCart: MyCart.fromJson(json["my_cart"]),
  );

  Map<String, dynamic> toJson() => {
    "my_cart": myCart.toJson(),
  };
}

class MyCart {
  int id;
  String userName;
  List<Item> items;
  List<CustomBouquet> customBouquets;

  MyCart({
    required this.id,
    required this.userName,
    required this.items,
    required this.customBouquets,
  });

  factory MyCart.fromRawJson(String str) => MyCart.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());

  factory MyCart.fromJson(Map<String, dynamic> json) => MyCart(
    id: json["id"],
    userName: json["user_name"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    customBouquets: List<CustomBouquet>.from(json["custom_bouquets"].map((x) => CustomBouquet.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_name": userName,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "custom_bouquets": List<dynamic>.from(customBouquets.map((x) => x.toJson())),
  };
}

class CustomBouquet {
  int id;
  String name;
  String totalPrice;
  List<Item> products;
  Color color;
  Design design;
  List<Addition> additions;

  CustomBouquet({
    required this.id,
    required this.name,
    required this.totalPrice,
    required this.products,
    required this.color,
    required this.design,
    required this.additions,
  });

  factory CustomBouquet.fromRawJson(String str) => CustomBouquet.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());

  factory CustomBouquet.fromJson(Map<String, dynamic> json) => CustomBouquet(
    id: json["id"],
    name: json["name"],
    totalPrice: json["total_price"],
    products: List<Item>.from(json["products"].map((x) => Item.fromJson(x))),
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

  factory Addition.fromRawJson(String str) => Addition.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());

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

class Color {
  int id;
  String name;
  String rgbCode;

  Color({
    required this.id,
    required this.name,
    required this.rgbCode,
  });

  factory Color.fromRawJson(String str) => Color.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());

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

  factory Design.fromRawJson(String str) => Design.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());

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

class Item {
  int id;
  int productId;
  String productName;
  int quantity;
  List<String> size;
  String? image;
  List<Addition>? additions;

  Item({
    required this.id,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.size,
    required this.image,
    this.additions,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    productId: json["product_id"],
    productName: json["product_name"],
    quantity: json["quantity"],
    size: List<String>.from(json["size"].map((x) => x)),
    image: json["image"],
    additions: json["additions"] == null ? [] : List<Addition>.from(json["additions"].map((x) => Addition.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "product_name": productName,
    "quantity": quantity,
    "size": List<dynamic>.from(size.map((x) => x)),
    "image": image,
    "additions": additions == null ? [] : List<dynamic>.from(additions!.map((x) => x.toJson())),
  };
}
