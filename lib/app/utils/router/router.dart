import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frank_and_joes/app/pages/forgot_password/forgotPassword.dart';
import 'package:frank_and_joes/app/pages/rewards/rewards_page.dart';
import 'package:frank_and_joes/app/pages/home/home_page.dart';
import 'package:frank_and_joes/app/pages/index/index.dart';
import 'package:frank_and_joes/app/pages/login/login_page.dart';
import 'package:frank_and_joes/app/pages/menu/menu_page.dart';
import 'package:frank_and_joes/app/pages/order/order_page.dart';
import 'package:frank_and_joes/app/pages/register/register_page.dart';
import 'package:frank_and_joes/app/utils/constants/pages.dart';
import 'package:frank_and_joes/app/utils/router/transitions.dart';

class Router {
  final RouteObserver<PageRoute> routeObserver;

  Router() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Pages.index:
        return _buildSlideLeftRoute(IndexPage());
      case Pages.home:
        return _buildSlideLeftRoute(HomePage());
      case Pages.menu:
        return _buildSlideLeftRoute(MenuPage());
      case Pages.rewards:
        return _buildSlideLeftRoute(RewardsPage());
      case Pages.order:
        return _buildSlideLeftRoute(OrderPage());
      case Pages.login:
        return _buildSlideTopRoute(LoginPage());
      case Pages.register:
        return _buildSlideRightRoute(RegisterPage());
      case Pages.forgotPassword:
        return _buildSlideBottomRoute(ForgotPasswordPage());
      default:
        return null;
    }
  }

  SlideLeftRoute _buildSlideLeftRoute(Widget page) {
    return new SlideLeftRoute(page: page);
  }

  SlideRightRoute _buildSlideRightRoute(Widget page) {
    return new SlideRightRoute(page: page);
  }

  SlideTopRoute _buildSlideTopRoute(Widget page) {
    return new SlideTopRoute(page: page);
  }

  SlideBottomRoute _buildSlideBottomRoute(Widget page) {
    return new SlideBottomRoute(page: page);
  }
}
