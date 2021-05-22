import 'package:auth_ecommerce_task/models/product.dart';
import 'package:flutter/cupertino.dart';

class Products with ChangeNotifier {
  List<Product> recomendedForYouList = [
    Product(
        oldPrice: null,
        percent: null,
        saved: null,
        image: 'assets/images/dark.png',
        title: 'Daek kiss - Bath&Body Work dsagffsdgs',
        sRate: 3.0,
        rRate: 107,
        price: '765.00'),
    Product(
        oldPrice: "1.010.00",
        percent: 52,
        saved: '460.00',
        image: 'assets/images/stars.png',
        title: 'Stars travek suze giftset Bath',
        sRate: 3.0,
        rRate: 7,
        price: '550.00'),
    Product(
        oldPrice: "1.010.00",
        percent: 52,
        saved: '460.00',
        image: 'assets/images/thousands.png',
        title: 'A Thousand miles Bath&Loshn',
        sRate: 3.0,
        rRate: 107,
        price: '550.00'),
  ];
  List<Product> mostSellingProducts = [
    Product(
        oldPrice: null,
        percent: null,
        saved: null,
        image: 'assets/images/oil.png',
        title: 'Organic argan Oil For Hair&Body',
        sRate: 3.0,
        rRate: 7,
        price: '650.00'),
    Product(
        oldPrice: "1.010.00",
        percent: 52,
        saved: '3.160.00',
        image: 'assets/images/run.png',
        title: 'Health Life C2500M Multi-Functions',
        sRate: 3.0,
        rRate: 7,
        price: '6.850.00'),
    Product(
        oldPrice: "1.010.00",
        percent: 52,
        saved: '460.00',
        image: 'assets/images/centrum.png',
        title: 'Centrum Pfizer Multivitmen',
        sRate: 3.0,
        rRate: 7,
        price: '550.00'),
  ];
}
