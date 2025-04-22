import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_page.dart';
import 'package:weather_app/widgets/weather_card.dart';

class HomeView extends StatelessWidget {
  final HomePageState state;
  const HomeView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.cloud_outlined, color: Colors.white),
        title: const Text(
          "Weather Forecast",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.wb_sunny_outlined, color: Colors.white),
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSearchField(),
              const SizedBox(height: 16),
              _buildSearchButton(),
              const SizedBox(height: 16),
              _buildContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Enter city name:'),
        SizedBox(height: 5),
        TextField(
          controller: state.controller,
          textInputAction: TextInputAction.search,
          onSubmitted: (_) => state.fetchWeather(),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.location_city, color: Colors.blueGrey),
            suffixIcon:
                state.controller.text.isNotEmpty
                    ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: state.clearSearchField,
                    )
                    : null,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 14,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          style: const TextStyle(fontSize: 16),
          onChanged: (_) => state.onSearchInputChanged(),
        ),
      ],
    );
  }

  Widget _buildSearchButton() {
    return ElevatedButton.icon(
      onPressed: state.isLoading ? null : state.fetchWeather,
      icon: const Icon(Icons.search, color: Colors.white),
      label: const Text("Check Weather"),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Center(
          child: Text(
            state.errorMessage!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.redAccent,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

    if (state.weather != null) {
      return WeatherCard(weather: state.weather!);
    }

    return Center(
      child: Text(
        "Please enter a city and press 'Check Weather'",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
