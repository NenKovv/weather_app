import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/exceptions/bad_request_exception.dart';
import 'package:weather_app/exceptions/city_not_found_exception.dart';
import 'package:weather_app/exceptions/invalid_api_key_exception.dart';
import 'package:weather_app/exceptions/weather_api_exception.dart';
import '../models/weather.dart';

class WeatherService {
  // Base API details
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String _units = 'metric';

  // Endpoints
  static const String _currentWeatherEndpoint = '/weather';

  final String _apiKey;

  WeatherService() : _apiKey = dotenv.env['API_KEY'] ?? '' {
    if (_apiKey.isEmpty) {
      throw Exception('API key is missing. Please check your .env file.');
    }
  }

  Future<WeatherModel> fetchWeather(String cityName) async {
    final Uri url = Uri.parse(
      '$_baseUrl$_currentWeatherEndpoint?q=$cityName&appid=$_apiKey&units=$_units',
    );

    try {
      final response = await http.get(url);

      switch (response.statusCode) {
        case 200:
          final data = jsonDecode(response.body) as Map<String, dynamic>;
          return WeatherModel.fromJson(data);
        case 404:
          throw const CityNotFoundException();
        case 401:
          throw const InvalidApiKeyException();
        case 400:
          throw const BadRequestException();
        default:
          throw HttpException(
            'Failed to fetch weather. '
            'Status code: ${response.statusCode}. '
            'Message: ${response.body}',
          );
      }
    } on WeatherApiException {
      rethrow;
    } on SocketException {
      throw Exception('No internet connection. Please check your network.');
    } on FormatException {
      throw Exception('Invalid response format from the server.');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
