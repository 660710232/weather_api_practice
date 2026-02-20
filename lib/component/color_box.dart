import 'package:flutter/material.dart';

class ColorBox extends StatelessWidget {
  final String aqi;
  ColorBox({super.key, required this.color, required this.aqi}) {
    setAqiScale(aqi);
  }

  Color color;
  void setAqiScale(String aqi) {
    int scale = int.parse(aqi);
    if (scale <= 50) {
      color = Colors.green;
    } else if (scale <= 100) {
      color = Colors.yellow;
    } else if (scale <= 150) {
      color = Colors.orange;
    } else if (scale <= 200) {
      color = Colors.red;
    } else if (scale <= 300) {
      color = Colors.purpleAccent;
    } else {
      color = Colors.deepPurple;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          "AQI : $aqi",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
