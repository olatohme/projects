// To parse this JSON data, do
//
//     final myorders = myordersFromJson(jsonString);

import 'dart:convert';

Myorders myordersFromJson(String str) => Myorders.fromJson(json.decode(str));

String myordersToJson(Myorders data) => json.encode(data.toJson());

class Myorders {
    List<Order> orders;

    Myorders({
        required this.orders,
    });

    factory Myorders.fromJson(Map<String, dynamic> json) => Myorders(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
    };
}

class Order {
    int orderId;
    String userId;
    String paymentMethod;
    String deliveryTo;
    String shippingMethod;
    String totalPrice;
    String notes;
    String status;

    Order({
        required this.orderId,
        required this.userId,
        required this.paymentMethod,
        required this.deliveryTo,
        required this.shippingMethod,
        required this.totalPrice,
        required this.notes,
        required this.status,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
       orderId: json["order_id"],
        userId: json["user_id"],
        paymentMethod: json["payment_method"],
        deliveryTo: json["delivery_to"],
        shippingMethod: json["shipping_method"],
        totalPrice: json["total_price"],
        notes: json["notes"],
        status:json["status"],
    );

    Map<String, dynamic> toJson() => {
       "order_id": orderId,
        "user_id": userId,
        "payment_method": paymentMethod,
        "delivery_to": deliveryTo,
        "shipping_method": shippingMethod,
        "total_price": totalPrice,
        "notes": notes,
        "status": status,
    };
}
