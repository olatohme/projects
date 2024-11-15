class showProviderModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String profileImageUrl;
  final int isActive;

  showProviderModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.profileImageUrl,
    required this.isActive,
  });

  factory showProviderModel.fromJson(Map<String, dynamic> json) {
    return showProviderModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'].toString(),
      profileImageUrl: json['profile_image_url'] ?? '',
      isActive: json['is_active'] 
    );
  }
}
