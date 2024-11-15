// // post_model.dart
// class Post {
//   final String description;
//   final List<String> gallery;
//
//   Post({required this.description, required this.gallery});
//
//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       description: json['description'],
//       gallery: List<String>.from(json['gallery']),
//     );
//   }
// }



// models/profile_model.dart
class Post {
  final int id;
  final String description;
  final List<String> imageUrls;

  Post({required this.id, required this.description, required this.imageUrls});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      description: json['description'],
      imageUrls: List<String>.from(json['imageUrls']),
    );
  }
}

class Profile {
  final int id;
  final String name;
  final String email;
  final int phone;
  final String profileImageUrl;
  final List<Post> posts;

  Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.profileImageUrl,
    required this.posts,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      profileImageUrl: json['profile_image_url']?? "",
      posts: (json['posts'] as List).map((i) => Post.fromJson(i)).toList(),
    );
  }
}
