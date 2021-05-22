import 'package:auth_ecommerce_task/theme/colors.dart';
import 'package:auth_ecommerce_task/views/home.dart';
import 'package:auth_ecommerce_task/views/profile.dart';
import 'package:auth_ecommerce_task/views/record.dart';
import 'package:flutter/material.dart';

import 'explore.dart';
import 'insurance.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = '/bottom_bar';
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': HomeScreen()},
      {
        'page': RecordScreen(),
      },
      {
        'page': ExploreScreen(),
      },
      {
        'page': InsuranceScreen(),
      },
      {
        'page': ProfileScreen(),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        // color: Colors.white,

        child: Container(
          height: 63,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: BottomNavigationBar(
              showUnselectedLabels: true,
              elevation: 20,
              iconSize: 30,
              onTap: _selectPage,
              backgroundColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedItemColor: AppColors.pColor,
              currentIndex: _selectedPageIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    child: Image.asset(
                      "assets/images/medical.png",
                      height: 30,
                    ),
                  ),
                  title: Text('Record'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore),
                  title: Text('Explore'),
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    child: Image.asset(
                      "assets/images/insurance.png",
                      height: 30,
                    ),
                  ),
                  title: Text('Insurance'),
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    child: Image.asset(
                      "assets/images/profile.png",
                      height: 30,
                    ),
                  ),
                  title: Text('Profile'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
