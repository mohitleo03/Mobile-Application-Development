import 'package:bloom_weather/constants.dart';
import 'package:bloom_weather/models/my_location.dart';
import 'package:bloom_weather/models/weather.dart';
import 'package:bloom_weather/models/weather_data.dart';
import 'package:bloom_weather/routes/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    var position = await MyLocation().getLocation();
    if (position != null) {
      WeatherData weatherData = await Weather(
              latitude: position.latitude, longitude: position.longitude)
          .getWeatherdata();
      if (weatherData != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => WeatherScreen(
                      weatherData: weatherData,
                    )));
      } else {}
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return mySpinner();
  }

  Widget mySpinner() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black87,
            kNavyBlueColor,
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingFour(
              size: 80,
              color: kYellowColor,
            ),
          ],
        ),
      ),
    );
  }
}
