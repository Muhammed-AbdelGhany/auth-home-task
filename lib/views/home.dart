import 'package:auth_ecommerce_task/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:auth_ecommerce_task/helpers/global-widgets.dart';
import 'package:auth_ecommerce_task/widgets/services_widget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controller = TextEditingController();
  String imagep = 'assets/images/products.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(children: [
          Container(
            child: Image.asset(
              'assets/images/badge.png',
              height: 26,
              width: 26,
            ),
          ),
          SizedBox(width: 12),
          Text(
            'Good Evening Ali',
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ]),
        actions: [
          IconButton(
              icon: Icon(Icons.menu), color: AppColors.pColor, onPressed: () {})
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: '           What are you looking for ?',
                      border: InputBorder.none,
                      prefixIcon: Image.asset(
                        'assets/images/search.png',
                        height: 26,
                        width: 26,
                      ),
                    )),
              ),
              SizedBox(height: 16),
              headLine('Trending'),
              SizedBox(height: 16),
              Container(
                height: 167,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/ad.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 16),
              headLine('Our Services'),
              SizedBox(height: 16),
              ServiceWidget(
                title: 'Product',
                image: imagep,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
