import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductWidget extends StatelessWidget {
  final image;
  final title;
  final sRate;
  final rRate;
  final price;
  final oldPrice;
  final saved;
  final percent;

  ProductWidget(
      {@required this.image,
      @required this.title,
      @required this.sRate,
      @required this.rRate,
      @required this.price,
      @required this.oldPrice,
      @required this.percent,
      @required this.saved});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        color: Colors.white,
        width: 160,
        height: 155,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Image.asset(image),
                    ),
                    if (percent != null)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 27,
                            height: 15,
                            color: Colors.blue[100],
                            child: Text('-$percent%',
                                style: TextStyle(fontSize: 8)),
                          ),
                          Container(
                            width: 2,
                            height: 40,
                          )
                        ],
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 11),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothStarRating(
                      allowHalfRating: false,
                      onRated: (v) {},
                      starCount: 5,
                      rating: sRate,
                      size: 8.0,
                      isReadOnly: true,
                      color: Colors.amber[400],
                      borderColor: Colors.grey,
                      spacing: 1.0),
                  Text(
                    '($rRate Reviews)',
                    style: TextStyle(fontSize: 8),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('$price EGP',
                    style: TextStyle(fontSize: 11, color: Colors.blue)),
              ),
              SizedBox(
                height: 8,
              ),
              if (oldPrice != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: Text(
                      '$oldPrice EGP',
                      style: TextStyle(
                          fontSize: 8,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough),
                    )),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            ' You Saved $saved',
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            ' EGP',
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
