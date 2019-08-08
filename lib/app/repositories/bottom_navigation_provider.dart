import 'package:flutter/material.dart';
import 'package:frank_and_joes/app/pages/home/home_page.dart';
import 'package:frank_and_joes/app/utils/constants/constants.dart';

class BottomNavigationProvider with ChangeNotifier {

  int currentIndex;
  Widget currentPage = HomePage();
  BottomNavigationProvider({this.currentIndex = 0, this.currentPage});

  int get index => currentIndex;

  changeIndex(int index) {
    currentIndex = index;
    currentPage = BottomNavigationItems.bottomNavPages[index];
    notifyListeners();
  }
}