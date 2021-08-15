import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:flutter_template_demo3/common/util/log_utils.dart';
import 'package:http/http.dart' as http;

class HttpLoggerInterceptor implements RequestInterceptor, ResponseInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    final base = await request.toBaseRequest();
    log.d('--> ${base.method} ${base.url}');
    base.headers.forEach((k, v) => log.d('$k: $v'));
    var bytes = '';
    if (base is http.Request) {
      final body = base.body;
      if (body.isNotEmpty) {
        log.d(body);
        bytes = ' (${base.bodyBytes.length}-byte body)';
      }
    }
    log.d('--> END ${base.method}$bytes');
    return request;
  }

  @override
  FutureOr<Response> onResponse(Response response) {
    final base = response.base.request;
    log.d('<-- ${response.statusCode} ${base!.url}');
    response.base.headers.forEach((k, v) => log.d('$k: $v'));
    var bytes;
    if (response.base is http.Response) {
      final resp = response.base as http.Response;
      if (resp.body.isNotEmpty) {
        log.d(resp.body);
        bytes = ' (${response.bodyBytes.length}-byte body)';
      }
    }
    log.d('--> END ${base.method}$bytes');
    return response;
  }
}
