part of 'login_api_cubit.dart';

@immutable
sealed class LoginApiState {}

final class LoginApiInitial extends LoginApiState {}

final class LoginApiLoading extends LoginApiState {}

final class LoginApiLoaded extends LoginApiState {

 final LoginResponse response;
 
 LoginApiLoaded(this.response);
}

final class LoginApiError extends LoginApiState {

}
