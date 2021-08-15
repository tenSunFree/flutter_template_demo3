import 'package:equatable/equatable.dart';
import 'package:flutter_template_demo3/home/model/home_photos_bean.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [Object()];

  @override
  String toString() {
    return this.runtimeType.toString();
  }
}

class LoadingState extends HomeState {}

class SuccessState extends HomeState {
  final List<HomePhotosBean> list;

  SuccessState(this.list);
}

class FailureState extends HomeState {
  final String error;

  FailureState(this.error);
}
