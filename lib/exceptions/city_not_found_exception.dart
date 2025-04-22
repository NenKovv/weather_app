import 'weather_api_exception.dart';

class CityNotFoundException extends WeatherApiException {
  const CityNotFoundException() : super('City not found. Please try again.');
}
