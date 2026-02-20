import 'package:flutter/material.dart';

class TextWeatherBox extends StatelessWidget {
  String aqi;
  String? text;
  Color color;
  TextWeatherBox({super.key, required this.aqi, this.text, this.color = Colors.green}) {
    text = setTextScale(aqi);
  }

  String setTextScale(String aqi) {
    int scale = int.parse(aqi);
    String text;
    if (scale <= 50) {
      text = 'Good';
      color = Colors.green;
    } else if (scale <= 100) {
      text = 'Moderate';
      color = Colors.yellow;
    } else if (scale <= 150) {
      text = 'Unhealthy for Sensitive Groups';
      color = Colors.orange;
    } else if (scale <= 200) {
      text = 'Unhealthy';
      color = Colors.red;
    } else if (scale <= 300) {
      text = 'Very Unhealthy';
      color = Colors.purpleAccent;
    } else {
      text = 'Hazardous';
      color = Colors.deepPurple;
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Text('$text',textAlign: TextAlign.center , style: TextStyle(color: color, fontSize: 22, fontWeight: FontWeight.bold)),
    );
  }
}
