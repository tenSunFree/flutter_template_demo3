import 'package:flutter_template_demo3/home/model/home_photos_bean.dart';
import 'package:flutter_template_demo3/common/remote/json_type_converter.dart';
import 'package:flutter_template_demo3/common/remote/json_type_converter_builder.dart';

abstract class JsonTypeConverterProvider {
  static JsonTypeConverter? _instance;

  JsonTypeConverterProvider._();

  static getDefault() => _instance ??= JsonTypeConverterBuilder()
      .registerConverter<HomePhotosBean>(
        toMap: (task2) => task2.toJson(),
        fromMap: (map) => HomePhotosBean.fromJson(map),
      )
      .build();
}
