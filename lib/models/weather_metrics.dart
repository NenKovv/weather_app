class WeatherMetrics {
  final double temperature;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  const WeatherMetrics({
    required this.temperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory WeatherMetrics.fromJson(Map<String, dynamic> json) {
    return WeatherMetrics(
      temperature: (json['temp'] ?? 0).toDouble(),
      feelsLike: (json['feels_like'] ?? 0).toDouble(),
      tempMin: (json['temp_min'] ?? 0).toDouble(),
      tempMax: (json['temp_max'] ?? 0).toDouble(),
      pressure: (json['pressure'] ?? 0).toInt(),
      humidity: (json['humidity'] ?? 0).toInt(),
    );
  }
}
