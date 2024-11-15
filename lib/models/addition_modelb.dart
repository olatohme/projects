class Addition {
    int id;
    int typeAdditionId;
    String name;
    String description;
    double price;
    String imageUrl;

    Addition({
        required this.id,
        required this.typeAdditionId,
        required this.name,
        required this.description,
        required this.price,
        required this.imageUrl,
    });

    factory Addition.fromJson(Map<String, dynamic> json) {
        return Addition(
            id: json['id'] ?? 0, // Provide a default value or handle null as per your logic
            typeAdditionId: json['type_addition_id'] ?? 0,
            name: json['name'] ?? '',
            description: json['description'] ?? '',
            price: double.parse(json['price'].toString()) ?? 0.0,
            imageUrl: json['image_url'] ?? '',
        );
    }
}
