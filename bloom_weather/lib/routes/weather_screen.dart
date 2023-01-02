import 'package:bloom_weather/constants.dart';
import 'package:bloom_weather/models/weather_data.dart';
import 'package:bloom_weather/widgets/resuable_card.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  final WeatherData weatherData;
  final List<HourlyData> _hourlyData = [];
  WeatherScreen({this.weatherData}) {
    for (int i = 0; i < weatherData.hourlyData.length; i += 3) {
      _hourlyData.add(weatherData.hourlyData[i]);
    }
    print("length : ${_hourlyData.length}");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: weatherData.currentTemp > 20
                    ? [kYellowColor, kOrangeColor]
                    : [kLightBlueColor, kDarkBlueColor]),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 30,
                    color: kNavyBlueColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    weatherData.cityName,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: kNavyBlueColor,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Image.network(
                  "http://openweathermap.org/img/w/${weatherData.icon}.png",
                  width: 200,
                  height: 200,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      weatherData.description,
                      style: TextStyle(
                        fontFamily: "NovaRound",
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: kNavyBlueColor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${weatherData.currentTemp} °C",
                      style: TextStyle(
                        fontFamily: "NovaRound",
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                        color: kNavyBlueColor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: AssetImage("images/wind.png"),
                              width: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${weatherData.windSpeed} km/h",
                              style: TextStyle(
                                color: kNavyBlueColor,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Row(
                          children: [
                            Image(
                              image: AssetImage("images/drop.png"),
                              width: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${weatherData.humidity} %",
                              style: TextStyle(
                                color: kNavyBlueColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _hourlyData
                      .map((hourData) => ResusableCard(
                            color: kCardColor,
                            cardChild: Column(
                              children: [
                                Text(
                                  hourData.time,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontFamily: "NovaRound",
                                    fontSize: 15,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Image.network(
                                  "http://openweathermap.org/img/w/${hourData.icon}.png",
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.fitWidth,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${hourData.temp} °C",
                                  style: TextStyle(
                                    fontFamily: "NovaRound",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: kNavyBlueColor,
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
