import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_demo3/common/router/main_router_delegate.dart';
import 'package:flutter_template_demo3/home/model/home_api_service.dart';
import 'package:flutter_template_demo3/common/di/get_it.dart';
import 'package:flutter_template_demo3/home/update/home_cubit.dart';
import 'package:provider/provider.dart';

class MainRouter extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MainRouter(this.navigatorKey, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final childBackButtonDispatcher =
        ChildBackButtonDispatcher(Router.of(context).backButtonDispatcher!)
          ..takePriority();
    return BlocProvider<HomeCubit>(
      create: (BuildContext context) =>
          HomeCubit(getIt.get<HomeApiService>()),
      child: ChangeNotifierProvider<MainRouterDelegate>(
          create: (_) => MainRouterDelegate(navigatorKey),
          child: Consumer<MainRouterDelegate>(
              builder: (context, authRouterDelegate, child) => Router(
                  routerDelegate: authRouterDelegate,
                  backButtonDispatcher: childBackButtonDispatcher))),
    );
  }
}