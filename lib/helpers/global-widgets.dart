import 'package:flutter/material.dart';

Widget headLine(String title) {
  return Container(
    alignment: Alignment.centerLeft,
    child: Text(
      title,
      textAlign: TextAlign.start,
      style: TextStyle(fontSize: 25),
    ),
  );
}
