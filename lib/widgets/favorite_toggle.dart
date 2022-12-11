import 'package:flutter/material.dart';

Icon itemFavoriteButton(bool isFavorited) {
  return Icon(
    isFavorited ? Icons.star : Icons.star_border,
    color: isFavorited ? Colors.amber : Colors.grey,
  );
}
