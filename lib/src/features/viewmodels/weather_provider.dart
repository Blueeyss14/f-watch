import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class WeatherProvider extends ChangeNotifier {
  String temperature = '';
  String city = '';

  Future<void> fetchWeather() async {
    String apiKey = dotenv.env['WEATHER_API_KEY'] ?? '';
    String url =
        'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=auto:ip&aqi=no';

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      //convert to integer
      double temp = data['current']['temp_c'];
      temperature = temp.toInt().toString();
      city = data['location']['name'];
    } else {
      temperature = '??';
      city = '';
    }
    notifyListeners();
  }
}
