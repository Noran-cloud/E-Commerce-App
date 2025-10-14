import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rwad2/Services/user_service.dart';
import 'package:rwad2/models/loginResponse.dart';

part 'login_api_state.dart';

class LoginApiCubit extends Cubit<LoginApiState> {
  final UserService userService;
  LoginApiCubit(this.userService) : super(LoginApiInitial());

   Future<void> login(String email, String pass) async{
    emit(LoginApiLoading());
    
    await Future.delayed(Duration(seconds: 3));
    try{
      final response = await userService.login(email,pass);
      if(response.accessToken != null)
          emit(LoginApiLoaded(response));
      else 
          emit(LoginApiError());          
    }
    catch(e){
      emit(LoginApiError());
    }
  }
}
