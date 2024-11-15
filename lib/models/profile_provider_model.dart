
class Profile {
  int id;
  String name;
  String email;
  String phone;
  int is_active;
  String profileImageUrl;

  Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.is_active,
    required this.profileImageUrl,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      is_active :json['is_active'],
      phone: json['phone'].toString(),
      profileImageUrl: json['profile_image_url'] ?? '',
    );
  }
}

