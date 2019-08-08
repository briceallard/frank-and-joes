import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frank_and_joes/app/repositories/bottom_navigation_provider.dart';
import 'package:frank_and_joes/app/utils/constants/constants.dart';
import 'package:frank_and_joes/app/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark),
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    BottomNavigationProvider bottomNav =
        Provider.of<BottomNavigationProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: CustomBottomNavigation(
        onTap: (index) {
          setState(() {
            bottomNav.changeIndex(index);
            _pageController.jumpToPage(index);
          });
        },
      ),
      body: PageView(
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        onPageChanged: (index) =>
            Provider.of<BottomNavigationProvider>(context).changeIndex(index),
        children: BottomNavigationItems.bottomNavPages,
      ),
    );
  }
}
