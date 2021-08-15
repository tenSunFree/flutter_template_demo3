import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_demo3/common/router/main_router_delegate.dart';
import 'package:flutter_template_demo3/splash/update/splash_cubit.dart';
import 'package:flutter_template_demo3/splash/model/splash_state.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      context.read<MainRouterDelegate>().setHomeNavigatorState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashCubit, SplashState>(
          listener: (listenerContext, state) {},
          builder: (context, state) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icon_splash.png"),
                      fit: BoxFit.fill)),
            );
          }),
    );
  }
}
