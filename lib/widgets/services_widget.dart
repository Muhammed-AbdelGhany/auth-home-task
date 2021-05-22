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
              borderRadius: BorderRadius.circular(5),
              child: Container(
                color: Colors.white,
                height: 60,
                width: 73,
                child: Image.asset(image),
              )),
          SizedBox(
            height: 8,
          ),
          Text(title),
        ],
      ),
    );
  }
}
