import 'package:animated_analog_clock/animated_analog_clock.dart';
import 'package:flutter/material.dart';

class WatchPage extends StatelessWidget {
  const WatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: AnimatedAnalogClock(
          dialType: DialType.none,
          size: MediaQuery.of(context).size.height,
          location: 'Asia/Jakarta',
          // Gradient Background if you want
          // backgroundGradient: RadialGradient(colors: []),
          // Set a network image as the background
          // backgroundImage: NetworkImage(
          // 'url',
          // ),
          // Alternatively, set an asset image as the background
          // backgroundImage: AssetImage(
          //   'path/to/your/asset/image.png',
          // ),
          backgroundColor: Color(0xff1E1E26),
          hourHandColor: Colors.lightBlueAccent,
          minuteHandColor: Colors.lightBlueAccent,
          secondHandColor: Colors.amber,
          centerDotColor: Colors.amber,
          hourDashColor: Colors.lightBlue,
          minuteDashColor: Colors.blueAccent,
        ),
      ),
    );
  }
}
