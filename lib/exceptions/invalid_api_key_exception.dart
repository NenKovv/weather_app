import 'weather_api_exception.dart';

class InvalidApiKeyException extends WeatherApiException {
  const InvalidApiKeyException()
    : super('Invalid API key. Please check your credentials.');
}
