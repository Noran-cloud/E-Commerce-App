import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rwad2/Services/weather_service.dart';
import 'package:rwad2/cubit/weather_cubit.dart';
import 'package:rwad2/models/weatherModel.dart';

class Displayweather extends StatefulWidget {
  const Displayweather({super.key});

  @override
  State<Displayweather> createState() => _DisplayweatherState();
}

class _DisplayweatherState extends State<Displayweather> {
  final weatherService = WeatherService();
  var weather = WeatherModel();

  void fetchWeather() async {
    try {
      weather = await weatherService.getWeather();
    } catch (e) {
      print(e.toString());
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${weather.name}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${weather.main?.temp ?? 0}°C',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(
                    weather.weather?[0].description ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
