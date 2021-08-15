import 'package:chopper/chopper.dart';
import 'package:flutter_template_demo3/home/model/home_photos_bean.dart';
import 'package:flutter_template_demo3/common/util/log_utils.dart';

part 'package:flutter_template_demo3/home/model/home_chopper_service.chopper.dart';

@ChopperApi()
abstract class HomeChopperService extends ChopperService {
  static create([ChopperClient? client]) => _$HomeChopperService(client);

  @Get(path: '/photos')
  Future<Response<List<HomePhotosBean>>> getPhotos();
}
