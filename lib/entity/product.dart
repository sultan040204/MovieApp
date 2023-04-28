import 'dart:convert';


class Product {
  final int id;
  final String name;
  final String description;
  final int price;
  final String imageOne;
  final String imageTwo;
  final String imageThree;
  final String filter;
  final bool active;
  final String data;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageOne,
    required this.imageTwo,
    required this.imageThree,
    required this.filter,
    required this.active,
    required this.data
  });

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
        price: json['price'] as int,
        imageOne: json['imageOne'] as String,
        imageTwo: json['imageTwo'] as String,
        imageThree: json['imageThree'] as String,
        filter: json['filter'] as String,
        active: json['active'] as bool,
        data: json['data'] as String
    );
  }

}