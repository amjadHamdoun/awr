
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/constant/key_constants.dart';
import '../../../preference.dart';
import '../api/login_remote.dart';
import 'login_state.dart';


part 'login_event.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRemoteDataSource loginRemoteDataSource;

  LoginBloc({
    required this.loginRemoteDataSource
   }) : super(LoginState.initial()) {
    on<LoginEventSubmit>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isSuccess = false
        ..isLoading = true
        ..error=''
        ));
      final result = await loginRemoteDataSource.login(
        obj: event.obj
      );

      return result.fold((l) async {
        Preferences.preferences!.setString(KeyConstants.keyUserToken,"test");
        print('l');
        emit(state.rebuild((b) => b
          ..isSuccess = false
          ..isLoading = false
          ..error = l));
      }, (r) async {
        print('r');
        if(r.accessToken!=null)
        {
          Preferences.preferences!.setString(KeyConstants.keyUserToken,r.accessToken!);

          emit(state.rebuild((b) => b
            ..isSuccess = true
            ..isLoading = false
            ..loginModel = r));

        }
        else
        {
          emit(state.rebuild((b) => b
            ..isLoading = false
            ..error="The email or password is incorrect".tr()
          ));
        }


      });
    });
  }


}

