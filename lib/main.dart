import 'package:flutter/material.dart';
import 'package:frank_and_joes/app/models/user_model.dart';
import 'package:frank_and_joes/app/pages/index/index.dart';
import 'package:frank_and_joes/app/pages/login/login_page.dart';
import 'package:frank_and_joes/app/pages/splash/splash_page.dart';
import 'package:frank_and_joes/app/repositories/auth_repository.dart';
import 'package:frank_and_joes/app/repositories/bottom_navigation_provider.dart';
import 'package:frank_and_joes/app/repositories/db_repository.dart';
import 'package:frank_and_joes/app/utils/constants/theme.dart';
import 'package:frank_and_joes/app/utils/router/router.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthRepository>.value(
              value: AuthRepository.instance()),
          ChangeNotifierProvider<DatabaseService>.value(
              value: DatabaseService.instance()),
          ChangeNotifierProvider(builder: (_) => BottomNavigationProvider())
        ],
        child: Consumer(
          builder: (BuildContext context, AuthRepository auth, _) {
            return StreamProvider<User>.value(
              initialData: User.initial(),
              value: DatabaseService.instance().getUser(auth.firebaseUser),
              child: Outlaws(),
            );
          },
        ),
      ),
    );

class Outlaws extends StatelessWidget {
  final Router _router;

  Outlaws() : _router = Router();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationProvider>(
      builder: (context, currentIndex, _) {
        return MaterialApp(
          title: 'Frank & Joe\'s',
          debugShowCheckedModeBanner: false,
          theme: CustomTheme().themeData,
          home: Authorize(),
          onGenerateRoute: _router.getRoute,
          navigatorObservers: [_router.routeObserver],
        );
      },
    );
  }
}

class Authorize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, AuthRepository auth, _) {
        switch (auth.status) {
          case Status.Uninitialized:
            return SplashPage();
          case Status.Unauthenticated:
          case Status.Authenticating:
          case Status.Authenticated:
            return IndexPage();
        }
      },
    );
  }
}
