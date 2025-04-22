import 'weather_api_exception.dart';

class BadRequestException extends WeatherApiException {
  const BadRequestException() : super('Please enter a valid city name.');
}
