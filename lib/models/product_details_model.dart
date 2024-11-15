import 'package:get/get.dart';

class ProductDetailsModel {
  int id;
  int collectionId;
  String name;
  String price;
  int quantity;
  String description;
  List<String> size;
  bool isActive;
  bool inStock;
  bool onSale;
  String image;
  dynamic rate;
  List<dynamic> additions;

  ProductDetailsModel({
    required this.id,
    required this.collectionId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.description,
    required this.size,
    required this.isActive,
    required this.inStock,
    required this.onSale,
    required this.image,
    this.rate,
    required this.additions,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json['id'],
      collectionId: json['collection_id'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
      description: json['description'],
      size: List<String>.from(json['size']),
      // size: json['size'] != null && json['size'] is List && json['size'].isNotEmpty
      //     ? List<String>.from(json['size'][0].split(','))
      //     : [],
      isActive: json['is_active'],
      inStock: json['in_stock'],
      onSale: json['on_sale'],
      image: json['image'] ?? '',
      rate: json['rate'],
      additions: json['additions'] != null ? List<dynamic>.from(json['additions']) : [],
    );
  }
}
class LikeStatus {
  final bool isLiked;

  LikeStatus({required this.isLiked});

  factory LikeStatus.fromJson(Map<String, dynamic> json) {
    return LikeStatus(
      isLiked: json['is_liked'],
    );
  }
}
