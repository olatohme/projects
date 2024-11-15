// class ProfileUser {
//   int id;
//   String firstName;
//   String lastName;
//   String email;
//   int phone;
//   String imageUrl;
//
//   ProfileUser({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.phone,
//     required this.imageUrl,
//   });
//
//   factory ProfileUser.fromJson(Map<String, dynamic> json) {
//     return ProfileUser(
//       id: json['user']['id'],
//       firstName: json['user']['first_name'],
//       lastName: json['user']['last_name'],
//       email: json['user']['email'],
//       phone: json['user']['phone'],
//       imageUrl: json['image_url'],
//     );
//   }
// }



class Profile {
  int id;
  String name;
  String email;
  String phone;
  String image;

  Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'].toString(),
      image: json['image'] ?? '',
    );
  }
}

