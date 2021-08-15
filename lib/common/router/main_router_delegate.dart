import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_demo3/splash/view/splash_page.dart';
import 'package:flutter_template_demo3/common/router/main_navigator_state.dart';
import 'package:flutter_template_demo3/home/view/home_page.dart';

class MainRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> navigatorKey;

  MainNavigatorState _authNavState;

  MainRouterDelegate(this.navigatorKey,
      [this._authNavState = const MainNavigatorState.splash()]);

  void setHomeNavigatorState() {
    _authNavState = MainNavigatorState.home(_authNavState);
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        pages: [
          if (_authNavState is SplashNavigatorState) LoginPage(),
          if (_authNavState is HomeNavigatorState) HomePage(),
        ],
        onPopPage: (route, result) {
          _authNavState =
              _authNavState.prevState ?? MainNavigatorState.splash();
          notifyListeners();
          return route.didPop(result);
        });
  }

  @override
  Future<void> setNewRoutePath(configuration) async {}
}
