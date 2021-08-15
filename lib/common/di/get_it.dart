import 'package:connectivity/connectivity.dart';
import 'package:flutter_template_demo3/home/model/home_api_service.dart';
import 'package:single_item_shared_prefs/single_item_shared_prefs.dart';
import 'package:flutter_template_demo3/common/remote/http_api_service_provider.dart';
import 'package:flutter_template_demo3/common/util/network_utils.dart';
import 'package:flutter_template_demo3/common/theme/preferences_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info/package_info.dart';
import 'package:single_item_storage/storage.dart';

final GetIt getIt = GetIt.asNewInstance();
const String preferredThemeModeKey = 'preferred-theme-mode';

Future<void> setupGlobalDependencies() async {
  final NetworkUtils utils = NetworkUtils(Connectivity());
  final String baseUrl = 'https://jsonplaceholder.typicode.com';
  HttpApiServiceProvider apiProvider = HttpApiServiceProvider(
    baseUrl: baseUrl,
    packageInfo: await PackageInfo.fromPlatform(),
  );
  HomeApiService apiService = apiProvider.getMainApiService();
  final PreferencesHelper helper = PreferencesHelper();
  getIt
    ..registerSingleton<HomeApiService>(apiService)
    ..registerSingleton<NetworkUtils>(utils)
    ..registerSingleton<PreferencesHelper>(helper)
    ..registerLazySingleton<Storage<bool>>(
        () =>
            SharedPrefsStorage<bool>.primitive(itemKey: preferredThemeModeKey),
        instanceName: preferredThemeModeKey);
}
