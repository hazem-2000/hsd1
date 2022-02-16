import 'dart:convert';

import 'package:http/http.dart 'as http;
import 'model.dart';

class WeatherApi{
  Future<Weather>getCurrentWeather(String?location)async{
    var endPoint=Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=cae9a81724774dd17a95e9965dc89eaa&units=metric");
    var response=await http.get(endPoint);
    var body=jsonDecode(response.body);
   print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);
  }
}