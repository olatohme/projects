class Provider {
  int id;
  String name;
  String email;
  int phone;
  String? profileImageUrl;
  int? isActive;

  Provider({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.profileImageUrl,
    this.isActive,
  });

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      profileImageUrl: json['profile_image_url'],
      isActive: json['is_active'],
    );
  }
}
