import 'package:f_smartwatch/src/features/viewmodels/timer_provider.dart';
import 'package:f_smartwatch/src/features/viewmodels/weather_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SetupProvider {
  static MultiProvider providerData(Widget child) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
        ChangeNotifierProvider(create: (_) => TimerProvider()),
      ],
      child: child,
    );
  }
}
