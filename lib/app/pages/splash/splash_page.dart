import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frank_and_joes/app/utils/constants/pages.dart';
import 'package:frank_and_joes/app/utils/constants/resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    Timer(Duration(milliseconds: 200), () {
      //verifyOpenedState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _buildBackground(),
          _buildLogo(),
          _buildProgressBar(),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(Resources.splash_bg),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Positioned(
      top: deviceHeight * .35,
      left: 0.0,
      right: 0.0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Image(
          height: 120.0,
          fit: BoxFit.contain,
          image: AssetImage(Resources.logo),
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Positioned(
      top: deviceHeight * .55,
      left: 0.0,
      right: 0.0,
      child: Column(
        children: <Widget>[
          CircularProgressIndicator(strokeWidth: 2.0),
        ],
      ),
    );
  }

  Future verifyOpenedState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _opened = (prefs.getBool('opened') ?? false);

    if (_opened) {
      Navigator.of(context).pushReplacementNamed(Pages.login);
    } else {
      prefs.setBool('opened', true);
      Navigator.of(context).pushReplacementNamed(Pages.home);
    }
  }
}
