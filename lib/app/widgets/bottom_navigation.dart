import 'package:flutter/material.dart';
import 'package:frank_and_joes/app/models/bottom_navigation_item_model.dart';
import 'package:frank_and_joes/app/repositories/bottom_navigation_provider.dart';
import 'package:frank_and_joes/app/utils/constants/constants.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigation extends StatefulWidget {
  final Function onTap;

  CustomBottomNavigation({this.onTap});
  @override
  CustomBottomNavigationState createState() => CustomBottomNavigationState();
}

class CustomBottomNavigationState extends State<CustomBottomNavigation>
    with TickerProviderStateMixin {
  int selectedIndex;

  @override
  void initState() {
    selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: deviceWidth,
      height: 80.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 10.0, color: Colors.black.withOpacity(0.2)),
        ],
      ),
      child: Padding(
        padding:
            EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0, bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: _buildBarItems(context),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems(BuildContext context) {
    List<Widget> _barItems = List();

    for (int i = 0; i < BottomNavigationItems.bottomNavItems.length; i++) {
      NavigationBarItem item = BottomNavigationItems.bottomNavItems[i];
      selectedIndex =
          Provider.of<BottomNavigationProvider>(context).currentIndex;
      bool isSelected = selectedIndex == i;

      _barItems.add(
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              selectedIndex = i;
              Provider.of<BottomNavigationProvider>(context)
                  .changeIndex(selectedIndex);
              widget.onTap(selectedIndex);
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedSize(
                vsync: this,
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 300),
                child: Icon(
                  item.iconData,
                  color: isSelected ? item.color : Colors.grey,
                  size: isSelected ? 28.0 : 24.0,
                ),
              ),
              AnimatedSize(
                vsync: this,
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 300),
                child: Text(
                  item.text,
                  style: isSelected
                      ? TextStyle(color: item.color, fontSize: 14.0)
                      : TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
              )
            ],
          ),
        ),
      );
    }
    return _barItems;
  }
}
