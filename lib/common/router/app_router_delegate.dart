import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_demo3/common/router/main_router.dart';
import 'package:flutter_template_demo3/common/router/no_animation_transition_delegate.dart';

class AppRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> navigatorKey;
  final GlobalKey<NavigatorState> mainNavigatorKey;

  AppRouterDelegate(this.navigatorKey, this.mainNavigatorKey);

  @override
  Widget build(BuildContext context) {
    return Navigator(
        transitionDelegate: NoAnimationTransitionDelegate(),
        key: navigatorKey,
        pages: _getPages(),
        onPopPage: (route, result) => route.didPop(result));
  }

  List<Page> _getPages() {
    return [
      MaterialPage(
          key: ValueKey('MainMaterialPage'),
          child: MainRouter(mainNavigatorKey))
    ];
  }

  @override
  Future<void> setNewRoutePath(configuration) async {}
}
