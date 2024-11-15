// To parse this JSON data, do
//
//     final providers = providersFromJson(jsonString);

import 'dart:convert';

Providers providersFromJson(String str) => Providers.fromJson(json.decode(str));

String providersToJson(Providers data) => json.encode(data.toJson());

class Providers {
    List<Provider> providers;

    Providers({
        required this.providers,
    });

    factory Providers.fromJson(Map<String, dynamic> json) => Providers(
        providers: List<Provider>.from(json["providers"].map((x) => Provider.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "providers": List<dynamic>.from(providers.map((x) => x.toJson())),
    };
}

class Provider {
    int id;
    String name;
    String email;
    int phone;
    String? profileImageUrl;

    Provider({
        required this.id,
        required this.name,
        required this.email,
        required this.phone,
        required this.profileImageUrl,
    });

    factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        profileImageUrl: json["profile_image_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "profile_image_url": profileImageUrl,
    };
}
