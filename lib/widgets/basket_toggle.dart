import 'package:flutter/material.dart';

Icon itemBasketButton(bool isFavorited) {
  return Icon(
    isFavorited ? Icons.shopping_basket_outlined : Icons.shopping_basket,
    color: isFavorited ? Colors.green : Colors.grey,
  );
}
