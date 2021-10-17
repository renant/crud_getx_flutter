import 'dart:convert';

class Product {
  int? id;
  String name;
  String description;
  num price;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  static Product empty() {
    return Product(
      id: null,
      name: '',
      description: '',
      price: 0,
    );
  }
}
