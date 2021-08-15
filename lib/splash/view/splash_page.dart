import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_demo3/common/util/log_utils.dart';
import 'package:flutter_template_demo3/splash/update/splash_cubit.dart';
import 'package:flutter_template_demo3/splash/view/splash_view.dart';

class LoginPage extends Page {
  @override
  Route createRoute(BuildContext context) {
    log.d('LoginPage, createRoute');
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => BlocProvider<SplashCubit>(
        create: (BuildContext context) => SplashCubit(),
        child: SplashView(),
      ),
    );
  }
}
