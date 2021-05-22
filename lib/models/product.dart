import 'package:flutter/cupertino.dart';

class Product {
  final String image;
  final String title;
  final double sRate;
  final int rRate;
  final String price;
  final String oldPrice;
  final String saved;
  final int percent;

  Product(
      {@required this.image,
      @required this.title,
      @required this.sRate,
      @required this.rRate,
      @required this.price,
      @required this.oldPrice,
      @required this.percent,
      @required this.saved});
}
