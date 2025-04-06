import 'package:f_smartwatch/src/features/viewmodels/weather_provider.dart';
import 'package:f_smartwatch/src/features/views/pages/calendar_page.dart';
import 'package:f_smartwatch/src/shared/style/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WatchMenu extends StatelessWidget {
  const WatchMenu({super.key});

  @override
  Widget build(BuildContext context) {
    String time = TimeOfDay.now().format(context);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMMM', 'en_US').format(now);

    final temperature = Provider.of<WeatherProvider>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (temperature.temperature == '') {
        temperature.fetchWeather();
      }
    });

    return Scaffold(
      backgroundColor: blue1,
      body: Center(
        child: Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width / 1.5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CalendarPage(),
                      ),
                    );
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    alignment: Alignment.center,
                    height: 25,
                    decoration: BoxDecoration(
                      color: blue1,
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF9DA9BB),
                          offset: Offset(8, 8),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: const Color(0xFFC6D3E4),
                          offset: Offset(-10, -5),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: double.infinity,
                          width: 30,
                          color: blue2,
                          child: Icon(Icons.calendar_month, size: 15),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              formattedDate,
                              style: TextStyle(
                                fontFamily: 'Digital7',
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 5),
              Row(
                children: [
                  Flexible(
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      decoration: BoxDecoration(
                        color: blue1,
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF9DA9BB),
                            offset: Offset(8, 8),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: const Color(0xFFC6D3E4),
                            offset: Offset(-10, -5),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Text(
                        time,
                        style: TextStyle(fontFamily: 'Digital7', fontSize: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                      color: blue1,
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF9DA9BB),
                          offset: Offset(8, 8),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: const Color(0xFFC6D3E4),
                          offset: Offset(-10, -5),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Text(
                      '${temperature.temperature}°C',
                      style: TextStyle(fontFamily: 'Digital7', fontSize: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
