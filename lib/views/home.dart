import 'package:auth_ecommerce_task/models/product.dart';
import 'package:auth_ecommerce_task/theme/colors.dart';
import 'package:auth_ecommerce_task/widgets/product_widget.dart';
import 'package:auth_ecommerce_task/widgets/reminders_widget.dart';
import 'package:flutter/material.dart';
import 'package:auth_ecommerce_task/helpers/global-widgets.dart';
import 'package:auth_ecommerce_task/widgets/services_widget.dart';
import 'package:auth_ecommerce_task/controllers/products_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controller = TextEditingController();
  String imagep = 'assets/images/products.png';
  String imagel = 'assets/images/labs.png';
  String imaged = 'assets/images/doctors.png';
  String imageh = 'assets/images/hospitals.png';
  String imagea = 'assets/images/appointments.png';
  String imager = 'assets/images/reminder.png';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Product> recomendedPRoducts =
        Provider.of<Products>(context).recomendedForYouList;
    List<Product> mostSellingProducts =
        Provider.of<Products>(context).mostSellingProducts;
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
        padding: EdgeInsets.symmetric(horizontal: 12),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ServiceWidget(
                    title: 'Product',
                    image: imagep,
                  ),
                  ServiceWidget(
                    title: 'Labs',
                    image: imagel,
                  ),
                  ServiceWidget(
                    title: 'Doctors',
                    image: imaged,
                  ),
                  ServiceWidget(
                    title: 'Hospitals',
                    image: imageh,
                  ),
                ],
              ),
              SizedBox(height: 16),
              headLine('Reminders'),
              SizedBox(height: 16),
              ReminderWidget(
                image: imager,
                title: 'Dose Rminder',
                subtitle: 'Next Dosage',
              ),
              SizedBox(height: 8),
              ReminderWidget(
                image: imagea,
                title: 'Appointments',
                subtitle: 'See Your Next Appointment',
              ),
              SizedBox(height: 16),
              headLine('Recommended For You'),
              SizedBox(height: 16),
              Container(
                height: 155,
                child: ListView.builder(
                  itemCount: recomendedPRoducts.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (ctx, i) => ProductWidget(
                      oldPrice: recomendedPRoducts[i].oldPrice,
                      percent: recomendedPRoducts[i].percent,
                      saved: recomendedPRoducts[i].saved,
                      image: recomendedPRoducts[i].image,
                      title: recomendedPRoducts[i].title,
                      sRate: recomendedPRoducts[i].sRate,
                      rRate: recomendedPRoducts[i].rRate,
                      price: recomendedPRoducts[i].price),
                ),
              ),
              SizedBox(height: 16),
              headLine('Most Selling'),
              SizedBox(height: 16),
              Container(
                height: 155,
                child: ListView.builder(
                  itemCount: mostSellingProducts.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (ctx, i) => ProductWidget(
                      oldPrice: mostSellingProducts[i].oldPrice,
                      percent: mostSellingProducts[i].percent,
                      saved: mostSellingProducts[i].saved,
                      image: mostSellingProducts[i].image,
                      title: mostSellingProducts[i].title,
                      sRate: mostSellingProducts[i].sRate,
                      rRate: mostSellingProducts[i].rRate,
                      price: mostSellingProducts[i].price),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
