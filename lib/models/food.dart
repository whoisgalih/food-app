import 'package:flutter/foundation.dart';

class Food {
  final String id;
  final String image;
  final String name;
  final String star;
  final String price;
  int quantity;

  Food({
    Key? key,
    required this.id,
    required this.image,
    required this.name,
    required this.star,
    required this.price,
    required this.quantity,
  });
}
