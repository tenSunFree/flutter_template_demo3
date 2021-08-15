import 'package:chopper/chopper.dart';
import 'package:flutter_template_demo3/home/model/home_api_service.dart';
import 'package:flutter_template_demo3/home/model/home_chopper_service.dart';
import 'package:flutter_template_demo3/common/remote/http_logger_interceptor.dart';
import 'package:flutter_template_demo3/common/remote/json_type_converter_provider.dart';
import 'package:http/http.dart' as http;
import 'package:package_info/package_info.dart';

class HttpApiServiceProvider {
  final ChopperClient _defaultClient;

  factory HttpApiServiceProvider({
    required String baseUrl,
    http.Client? httpClient,
    PackageInfo? packageInfo,
    Converter? converter,
  }) {
    converter ??= JsonTypeConverterProvider.getDefault();
    ChopperClient defaultClient = ChopperClient(
        baseUrl: baseUrl,
        client: httpClient,
        services: [HomeChopperService.create()],
        converter: converter,
        errorConverter: JsonConverter(),
        interceptors: [HttpLoggerInterceptor()]);
    return HttpApiServiceProvider.withClients(defaultClient);
  }

  HttpApiServiceProvider.withClients(ChopperClient defaultClient)
      : _defaultClient = defaultClient;

  HomeApiService getMainApiService() =>
      HomeApiService(_defaultClient.getService<HomeChopperService>());
}
