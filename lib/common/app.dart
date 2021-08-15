import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template_demo3/common/router/app_router_delegate.dart';
import 'package:flutter_template_demo3/common/theme/app_theme.dart';
import 'package:flutter_template_demo3/common/theme/preferences_helper.dart';
import 'package:flutter_template_demo3/common/di/get_it.dart';
import 'package:flutter_template_demo3/common/theme/theme_change_notifier.dart';
import 'package:provider/provider.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final mainNavigatorKey = GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouterDelegate _appRouterDelegate;

  @override
  void initState() {
    super.initState();
    _appRouterDelegate = AppRouterDelegate(rootNavigatorKey, mainNavigatorKey);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChangeNotifier>(
            create: (context) =>
                getIt.get<PreferencesHelper>().themePreferred),
        ChangeNotifierProvider<AppRouterDelegate>(
            create: (context) => _appRouterDelegate),
      ],
      child: Consumer<ThemeChangeNotifier>(builder: (context, themeObject, _) {
        return MaterialApp(
          theme: themeLight(),
          darkTheme: themeDark(),
          themeMode: themeObject.getThemeMode,
          home: Router(
              routerDelegate: _appRouterDelegate,
              backButtonDispatcher: RootBackButtonDispatcher()),
        );
      }),
    );
  }
}

Future<void> preAppConfig() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGlobalDependencies();
  await getIt.get<PreferencesHelper>().init();
}
