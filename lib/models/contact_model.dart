class Contact {
  final String email;
  final String address;
  final String phone;

  Contact({required this.email, required this.address, required this.phone});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
    );
  }
}
