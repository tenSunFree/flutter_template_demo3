import 'package:bloc/bloc.dart';
import 'package:flutter_template_demo3/home/model/home_api_service.dart';
import 'package:flutter_template_demo3/common/util/log_utils.dart';
import '../model/home_state.dart';
export '../model/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeApiService apiService;

  // final UserManager userManager;

  String? _username = '';
  String? _password = '';

  HomeCubit(this.apiService) : super(LoadingState());

  Future<void> onPasswordEntered(String password) async {
    // Log.d('SignUpCubit - User sign up: username $password');
    log.d('SignupCubit, onPasswordEntered, password: $password');
    _password = password;
  }

  Future<void> getData() async {
    // Log.d('SignUpCubit - User sign up: username $_username');
    // Log.d('SignUpCubit - User sign up: password $_password');
    log.d('SignupCubit, onUserSignup, _username: $_username');
    log.d('SignupCubit, onUserSignup2, _password: $_password');

    emit(LoadingState());

    log.d('SignupCubit, onUserSignup3');
    // final User user = User(id: "111", email: _username!);

    try {
      // log.d('UserApiService, signUp2');
      // return _chopper.signUp(user).toType();

      log.d('SignupCubit, onUserSignup4');
      await apiService.signUp().then((a) {
        log.d('SignupCubit, onUserSignup5, a: ${a.toString()}');
        // emit(SignupSuccess());

        emit(SuccessState(a));
        // return userManager.login(_username!, _password!);
      });
    } catch (error) {
      log.d('SignupCubit, onUserSignup6, a: ${error.toString()}');

      if (error.toString().contains('No address associated with hostname')) {
        emit(FailureState('請檢查網路是否連線正常'));
      } else {
        emit(FailureState(error.toString()));
      }

      // log.d('UserApiService, signUp3, error: $error');
      // return _chopper.signUp(user).toType();
    }

    // log.d('SignupCubit, onUserSignup6');
    // emit(SignupSuccess());
  }
}
