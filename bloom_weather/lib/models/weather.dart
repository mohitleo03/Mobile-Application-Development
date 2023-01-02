import 'package:bloom_weather/constants.dart';
import 'package:bloom_weather/models/weather_data.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'network_helper.dart';

class Weather {
  String _weatherUrl;
  double latitude, longitude;
  Weather({@required this.latitude, @required this.longitude}) {
    print("$latitude : $longitude");
    _weatherUrl =
        "https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=minutely,daily,alerts&appid=$kApiKey&units=metric";
  }

  Future<WeatherData> getWeatherdata() async {
    dynamic data = await NetworkHelper(url: _weatherUrl).getData();
    final coordinates = Coordinates(latitude, longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    String cityName = addresses.first.adminArea.split(" ")[0];
    return WeatherData(
      cityName: cityName,
      currentTemp: (data["current"]["temp"]).toInt(),
      windSpeed: (data["current"]["wind_speed"]).toInt(),
      humidity: data["current"]["humidity"],
      description: data["current"]["weather"][0]["main"],
      hourlyData: data["hourly"],
      icon: data["current"]["weather"][0]["icon"],
    );
  }
}
