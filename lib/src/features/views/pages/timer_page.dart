import 'package:f_smartwatch/src/features/viewmodels/timer_provider.dart';
import 'package:f_smartwatch/src/shared/components/circle_profile.dart';
import 'package:f_smartwatch/src/shared/style/custom_color.dart';
import 'package:f_smartwatch/src/shared/widget/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);

    super.build(context);
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios, size: 13, color: blue3),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (timerProvider.selectedMinute == 0 &&
                      timerProvider.selectedSecond == 0)
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Timer",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: blue3,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 3),
                              Icon(Icons.alarm, size: 18, color: blue3),
                            ],
                          ),

                          Text(
                            "Scroll Timer",
                            style: TextStyle(fontSize: 12, color: blue2),
                          ),
                        ],
                      ),
                    )
                  else
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${(timerProvider.remainingSeconds ~/ 60).toString().padLeft(2, '0')}:${(timerProvider.remainingSeconds % 60).toString().padLeft(2, '0')}",
                            style: TextStyle(fontSize: 20, color: blue3),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleProfile(
                                onTap: timerProvider.resetTimer,
                                width: 15,
                                height: 15,
                                color: blue2,
                                child: Icon(
                                  Icons.refresh,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10),
                              CircleProfile(
                                onTap: () {
                                  if (timerProvider.isRunning) {
                                    timerProvider.pauseTimer();
                                  } else {
                                    timerProvider.startTimer();
                                  }
                                },
                                width: 15,
                                height: 15,
                                color:
                                    timerProvider.isRunning
                                        ? Colors.white
                                        : blue2,
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 12,
                                  color:
                                      timerProvider.isRunning
                                          ? blue2
                                          : Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: blue2,
                      boxShadow: [
                        BoxShadow(
                          color: blue3.withAlpha(100),
                          offset: const Offset(0, 0),
                          blurRadius: 3,
                          spreadRadius: 0.2,
                        ),
                      ],
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5 - 40,
                          height: MediaQuery.of(context).size.width / 4,
                          child: ListWheelScrollView.useDelegate(
                            itemExtent: 20,
                            onSelectedItemChanged: (index) {
                              setState(() {
                                timerProvider.selectedMinute = index;
                                timerProvider.remainingSeconds =
                                    timerProvider.selectedMinute * 60 +
                                    timerProvider.selectedSecond;
                              });
                            },
                            childDelegate: ListWheelChildBuilderDelegate(
                              builder: (context, index) {
                                if (index < 0 || index > 59) return null;
                                return Center(
                                  child: Text(
                                    index.toString().padLeft(2, '0'),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                              childCount: 60,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5 - 40,
                          height: MediaQuery.of(context).size.width / 4,
                          child: ListWheelScrollView.useDelegate(
                            itemExtent: 20,
                            onSelectedItemChanged: (index) {
                              setState(() {
                                timerProvider.selectedSecond = index;
                                timerProvider.remainingSeconds =
                                    timerProvider.selectedMinute * 60 +
                                    timerProvider.selectedSecond;
                              });
                            },

                            childDelegate: ListWheelChildBuilderDelegate(
                              builder: (context, index) {
                                if (index < 0 || index > 59) return null;
                                return Center(
                                  child: Text(
                                    index.toString().padLeft(2, '0'),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                              childCount: 60,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
