import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_api_practice/component/color_box.dart';
import 'package:weather_api_practice/component/text_weather_box.dart';
import 'package:weather_api_practice/model/weather_data.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather? weatherData;
  // final TextEditingController _idSearchController = TextEditingController();
  void fetchWeather() async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://api.waqi.info/feed/here/?token=c915d03dc08e983b228b0ab809b5b7eb642ad1d0",
        ),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        Weather weather = Weather.fromJson(data);

        setState(() {
          weatherData = weather;
        });
        print('AQI : ${weather.aqi}');
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Air Quality Index (AQI)'),
        centerTitle: true,
        backgroundColor: Colors.blue[100],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(weatherData!.city, style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10,),
                ColorBox(
                  color: Colors.green,
                  aqi: weatherData == null ? '0' : weatherData!.aqi,
                ),
                SizedBox(width: 10,),
              ],
            ),
            SizedBox(height: 15),
            TextWeatherBox(aqi: weatherData == null ? '0' : weatherData!.aqi),
            SizedBox(height: 10),
            Text('temperature: ${weatherData!.temperature} C', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  fetchWeather();
                });
              },
              child: Text('Reload'),
            ),
          ],
        ),
      ),
    );
  }
}
