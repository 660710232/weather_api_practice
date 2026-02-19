class Weather {
  int id;
  String aqi;
  String city;
  String temperature;

  Weather(this.id, this.aqi, this.city, this.temperature);

  Weather.fromJson(Map<String, dynamic> json)
    : id = json['id'],
    aqi = json['aqi'],
    city = json['city'],
    temperature = json['temperature'];

  Map<String, dynamic> toJson(){
    return {'id' : id, 'aqi' : aqi, 'city' : city, 'temperature' : temperature};
  }
}