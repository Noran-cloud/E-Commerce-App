import 'package:dio/dio.dart';
import 'package:rwad2/models/weatherModel.dart';

class WeatherService {
  final dio = Dio();

  Future<WeatherModel> getWeather() async {
    var weather = WeatherModel();
    try {
      final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather',
        queryParameters: {
          'lat': 33.44,
          'lon': -94.04,
          'appid': '924269d70f4cd9f0b71874f7551eb449',
        },
      );
      print('StatusCode: ${response.statusCode}');

      weather = WeatherModel.fromJson(response.data);
    } 
    catch (e) {
      print(e.toString());
    }

    return weather;
  }
}
