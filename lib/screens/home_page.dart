import 'package:flutter/material.dart';
import 'package:weather_app/exceptions/city_not_found_exception.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_api_service.dart';
import 'package:weather_app/widgets/custom_snackbar.dart';
import 'home_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  final WeatherService weatherService = WeatherService();

  WeatherModel? weather;
  bool isLoading = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) => HomeView(this);

  Future<void> fetchWeather() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
      weather = null;
    });

    try {
      final result = await weatherService.fetchWeather(controller.text);
      setState(() => weather = result);
    } on CityNotFoundException catch (e) {
      setState(() => errorMessage = e.message);
    } catch (e) {
      if (!mounted) return;
      showCustomSnackbar(
        context,
        message: e.toString(),
        type: SnackbarType.error,
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  void onSearchInputChanged() {
    setState(() {});
  }

  void clearSearchField() {
    controller.clear();
    setState(() {});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
