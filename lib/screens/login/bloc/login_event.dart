part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginEventSubmit extends LoginEvent {
  final Map<String,dynamic> obj;


  const LoginEventSubmit({
    required this.obj
  });

  @override
  List<Object> get props => [obj];

}

class LoginEventCall extends LoginEvent {
  final String number;

  const LoginEventCall({
    required this.number,
  });

  @override
  List<Object> get props => [number];
}

class LoginEventLanguage extends LoginEvent {

  const LoginEventLanguage();

  @override
  List<Object> get props =>  [];

}
