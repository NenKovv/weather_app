import 'package:weather_app/models/coord.dart';
import 'package:weather_app/models/weather_metrics.dart';
import 'package:weather_app/models/wind.dart';

class WeatherModel {
  final String cityName;
  final Coord coord;
  final WeatherMetrics metrics;
  final Wind wind;
  final String country;
  final String description;

  const WeatherModel({
    required this.cityName,
    required this.coord,
    required this.metrics,
    required this.wind,
    required this.country,
    required this.description,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final weather = (json['weather'] as List?)?.first ?? {};
    final sys = json['sys'] as Map<String, dynamic>? ?? {};

    return WeatherModel(
      cityName: json['name'] ?? 'Unknown city',
      coord: Coord.fromJson(json['coord']),
      metrics: WeatherMetrics.fromJson(json['main']),
      wind: Wind.fromJson(json['wind']),
      country: sys['country'] ?? '',
      description: weather['description'] ?? 'No description',
    );
  }
}
