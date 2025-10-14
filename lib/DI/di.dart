import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rwad2/DataBase/DatabaseHelper.dart';
import 'package:rwad2/Services/user_service.dart';

final locator = GetIt.instance;

Future<void> init() async{
locator.registerLazySingleton<Dio>(()=> Dio());
locator.registerLazySingleton<UserService>(()=> UserService(locator<Dio>()));
locator.registerLazySingleton<Databasehelper>(()=>Databasehelper());
}