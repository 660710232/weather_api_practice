class Weather {
  final String aqi;
  final String city;
  final String temperature;

  Weather(this.aqi, this.city, this.temperature);

  Weather.fromJson(Map<String, dynamic> json)
    : aqi = json['data']['aqi'].toString(),
    city = json['data']['city']['name'],
    temperature = json['data']['iaqi']['t']['v'].toString();

  Map<String, dynamic> toJson(){
    return {'aqi' : aqi, 'city' : city, 'temperature' : temperature};
  }
}