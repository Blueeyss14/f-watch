import 'package:f_smartwatch/src/features/viewmodels/weather_provider.dart';
import 'package:f_smartwatch/src/shared/style/custom_color.dart';
import 'package:f_smartwatch/src/shared/widget/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_icons/weather_icons.dart';

class TemperaturePage extends StatelessWidget {
  const TemperaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    final temperatureProvider = Provider.of<WeatherProvider>(context);
    int temp = int.tryParse(temperatureProvider.temperature) ?? 0;
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back_ios, size: 13, color: blue3),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (temp < 20)
                      BoxedIcon(WeatherIcons.day_rain, color: blue3)
                    else
                      BoxedIcon(WeatherIcons.day_cloudy, color: blue3),
                    Text(
                      "${temperatureProvider.city} - $temp°C",
                      style: TextStyle(fontSize: 10, color: blue3),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
