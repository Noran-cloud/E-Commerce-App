import 'package:bloc/bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meta/meta.dart';
import 'package:rwad2/Services/weather_service.dart';
import 'package:rwad2/models/weatherModel.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherService weatherService;
  WeatherCubit(this.weatherService) : super(WeatherInitial());

  Future<void> getWeather() async {
    emit(WeatherLoading());
    try {
      final weather = await weatherService.getWeather();
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
