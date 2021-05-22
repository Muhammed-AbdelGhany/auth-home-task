import 'package:flutter/material.dart';

class ReminderWidget extends StatelessWidget {
  final title;
  final image;
  final subtitle;

  ReminderWidget({this.title, this.subtitle, this.image});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(6),
        width: double.infinity,
        height: 55,
        child: Row(
          children: [
            Image.asset(image),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    subtitle,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
