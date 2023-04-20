import 'dart:convert';
import 'package:http/http.dart' as http;

import 'weather.dart';

class WeatherApiClient {
  static const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<int> getLocationId(String city) async{
    final locationUrl = Uri.parse('$baseUrl?q=$city&appid=$key');
    final locationResponse = await http.get(locationUrl);

    if(locationResponse.statusCode !=200) {
      throw Exception('Error getting locationId fot city: $city');
    }
    final locationJson = jsonDecode(locationResponse.body);
    return locationJson['id'] as int;
  }

  Future <Weather> fetchWeather (int locationId) async {
    final weatherUrl = Uri.parse('$baseUrl?id=$locationId&appid=$key');
    final weatherResponse = await http.get(weatherUrl);
    print(weatherResponse.body);
    final weatherJson = jsonDecode(weatherResponse.body);
    return Weather.fromJson(weatherJson);
  }

  Future<Weather> getWeather (String city) async{
    final locationId = await getLocationId(city);
    return fetchWeather(locationId);
  }
}