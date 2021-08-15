import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_demo3/common/util/log_utils.dart';
import 'package:flutter_template_demo3/home/view/home_view.dart';

class HomePage extends Page {
  @override
  Route createRoute(BuildContext context) {
    log.d('PasswordPage, createRoute');
    return CupertinoPageRoute(
      settings: this,
      builder: (BuildContext context) => HomeView(),
    );
  }
}