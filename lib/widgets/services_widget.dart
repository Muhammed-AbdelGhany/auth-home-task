import 'package:flutter/material.dart';

class ServiceWidget extends StatelessWidget {
  final title;
  final image;

  ServiceWidget({@required this.title, @required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
              child: Container(
            child: Image.asset(image),
          )),
          Text(title),
        ],
      ),
    );
  }
}
