import 'package:flutter/material.dart';

import 'package:ionicons/ionicons.dart';
import 'package:notched_bottom_navigation_bar/search_screen.dart';
import 'package:notched_bottom_navigation_bar/user_information_screen.dart';
import 'cart_screen.dart';
import 'feeds_screen.dart';
import 'home_screen.dart';


class NotchedBottomNavigationBarScreen extends StatefulWidget {
  @override
  _NotchedBottomNavigationBarScreenState createState() => _NotchedBottomNavigationBarScreenState();
}

class _NotchedBottomNavigationBarScreenState extends State<NotchedBottomNavigationBarScreen> {
  List? _pages;
  int? _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      HomeScreen(),
      FeedsScreen(),
      SearchScreen(),
      CartScreen(),
      UserInformationScreen(),
    ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages![_selectedIndex!],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 3,
        clipBehavior: Clip
            .antiAlias,
        shape: CircularNotchedRectangle(),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 0.3,
              ),
            ),
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFF0099FF),
            onTap: _selectedPage,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.blue.shade900,
            currentIndex: _selectedIndex!,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Ionicons.home_outline),
                tooltip: 'Home',
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.compass_outline),
                tooltip: 'Feeds',
                label: 'Feeds',
              ),
              BottomNavigationBarItem(
                activeIcon: null,
                icon: Icon(null),
                tooltip: 'Search',
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.cart_outline),
                tooltip: 'Cart',
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.person_outline),
                tooltip: 'User',
                label: 'User',
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF0099FF),
        tooltip: 'Search',
        elevation: 7,
        child: (Icon(Ionicons.search_outline)),
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
      ),
    );
  }
}
