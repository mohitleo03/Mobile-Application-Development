import 'package:intl/intl.dart';

class WeatherData {
  String cityName;
  int currentTemp;
  int windSpeed;
  int humidity;
  String description;
  List<HourlyData> hourlyData;
  String icon;
  WeatherData({
    this.cityName,
    this.currentTemp,
    this.windSpeed,
    this.humidity,
    this.description,
    List<dynamic> hourlyData,
    this.icon,
  }) {
    this.hourlyData = hourlyData.map((hour) {
      return HourlyData(
          timeStamp: hour["dt"],
          temp: (hour["temp"]).toInt(),
          icon: hour["weather"][0]["icon"]);
    }).toList();
  }
}

class HourlyData {
  String time;
  int temp;
  String icon;
  HourlyData({
    int timeStamp,
    this.temp,
    this.icon,
  }) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    time = DateFormat("h:mma").format(date);
  }
}
