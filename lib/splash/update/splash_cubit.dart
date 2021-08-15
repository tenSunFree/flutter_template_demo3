import 'package:bloc/bloc.dart';
import 'package:flutter_template_demo3/splash/model/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(InitializationState());
}
