import 'package:flutter_template_demo3/home/model/home_chopper_service.dart';
import 'package:flutter_template_demo3/home/model/home_photos_bean.dart';
import 'package:flutter_template_demo3/common/remote/response_to_type_converter.dart';

class HomeApiService {
  final HomeChopperService _chopper;

  HomeApiService(this._chopper);

  Future<List<HomePhotosBean>> signUp() {
    return _chopper.getPhotos().toType();
  }
}
