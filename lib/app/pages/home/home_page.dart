import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' as prefix0;
import 'package:frank_and_joes/app/utils/constants/pages.dart';
import 'package:frank_and_joes/app/utils/constants/resources.dart';
import 'package:frank_and_joes/app/utils/constants/theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark),
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 10.0,
              right: 0.0,
              left: 0.0,
              height: 60.0,
              child: Image(
                image: AssetImage(Resources.logo),
              ),
            ),
            Positioned(
              top: 120.0,
              left: 30.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Welcome back',
                    style: CustomTheme().subtitle,
                  ),
                  Text(
                    'Brice'.toUpperCase(),
                    style: CustomTheme().pageTitle,
                  ),
                ],
              ),
            ),
            Center(
              child: MaterialButton(
                color: CustomColors.teal,
                elevation: 5.0,
                onPressed: () => Navigator.of(context).pushNamed(Pages.login),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Signin',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
