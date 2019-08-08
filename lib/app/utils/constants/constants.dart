import 'package:flutter/material.dart';
import 'package:frank_and_joes/app/models/bottom_navigation_item_model.dart';
import 'package:frank_and_joes/app/pages/rewards/rewards_page.dart';
import 'package:frank_and_joes/app/pages/home/home_page.dart';
import 'package:frank_and_joes/app/pages/menu/menu_page.dart';
import 'package:frank_and_joes/app/pages/order/order_page.dart';

class BottomNavigationItems {
  static List<Widget> bottomNavPages = [
    HomePage(),
    MenuPage(),
    RewardsPage(),
    OrderPage(),
  ];

  static List<NavigationBarItem> bottomNavItems = [
    NavigationBarItem(
      text: 'Home',
      iconData: Icons.home,
      color: Colors.teal,
    ),
    NavigationBarItem(
      text: 'Menu',
      iconData: Icons.restaurant,
      color: Colors.teal,
    ),
    NavigationBarItem(
      text: 'Rewards',
      iconData: Icons.local_play,
      color: Colors.teal,
    ),
    NavigationBarItem(
      text: 'Order',
      iconData: Icons.receipt,
      color: Colors.teal,
    ),
  ];
}
