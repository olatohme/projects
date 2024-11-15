
class LikedProduct {
  final int id;
  final int collectionId;
  final String name;
  final String price;
  final String description;
  final List<String> size;
  final int minLevel;
  final bool isActive;
  final bool inStock;
  final bool onSale;
  final String image;
  final double? rate;

  LikedProduct({
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
    this.rate,
  });

  factory LikedProduct.fromJson(Map<String, dynamic> json) {
    return LikedProduct(
      id: json['id'],
      collectionId: json['collection_id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      size: List<String>.from(json['size']),
      minLevel: json['min_level'],
      isActive: json['is_active'],
      inStock: json['in_stock'],
      onSale: json['on_sale'],
      image: json['image'],
      rate: json['rate'] != null ? json['rate'].toDouble() : null,
    );
  }
}
