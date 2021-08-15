import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template_demo3/common/util/log_utils.dart';
import 'package:flutter_template_demo3/common/remote/map_converter.dart';

@immutable
class JsonTypeConverter implements Converter {
  final Map<Type, MapConverter<dynamic>> _converterMap;

  const JsonTypeConverter(this._converterMap);

  @override
  Request convertRequest(Request request) {
    request = applyHeader(
      request,
      contentTypeKey,
      jsonHeaders,
      override: false,
    );
    final contentType = request.headers[contentTypeKey];
    if (contentType == null || !contentType.contains(jsonHeaders)) {
      return request;
    }
    if (request.body == null) {
      return request;
    }
    final type = request.body.runtimeType;
    final typeConverterDynamic = _converterMap[type];
    final typeConverter;
    if (typeConverterDynamic.runtimeType == typeConverterDynamic.runtimeType) {
      typeConverter = typeConverterDynamic;
    } else {
      typeConverter = null;
    }
    if (typeConverter == null) {
      log.w('JsonTypeConverter - No converter found for type: $type');
      return request;
    }
    final body = jsonEncode(typeConverter.toMap(request.body));
    return request.copyWith(body: body);
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    final supportedContentTypes = [jsonHeaders, jsonApiHeaders];
    final contentType = response.headers[contentTypeKey];
    var body = response.body;
    if (supportedContentTypes.contains(contentType)) {
      body = utf8.decode(response.bodyBytes);
    }
    try {
      body = json.decode(body);
    } catch (e) {
      log.w('JsonTypeConverter - Could not decode json body.'
          ' Response type: ${BodyType.runtimeType}'
          ' Error: $e');
    }
    final typeConverter = _converterMap[InnerType];
    if (typeConverter == null) {
      log.w('JsonTypeConverter - No converter found for type: $InnerType');
    } else {
      if (isTypeOf<BodyType, InnerType>()) {
        body = typeConverter.fromMap(body) as InnerType;
      } else if (isTypeOf<BodyType, Iterable<InnerType>>()) {
        log.d('JsonTypeConverter, convertResponse, body: ${body.toString()}');
        body = body.map((item) => typeConverter.fromMap(item) as InnerType);
        body = body.cast<InnerType>();
        if (isTypeOf<BodyType, List<InnerType>>()) {
          body = (body as Iterable<InnerType>).toList();
        }
      } else if (isTypeOf<BodyType, Map<String, InnerType>>()) {
        body = body.map((key, item) =>
            MapEntry(key, typeConverter.fromMap(item) as InnerType));
        body = body.cast<String, InnerType>();
      }
    }
    return response.copyWith<BodyType>(body: body);
  }
}
