import 'package:date_picker_timeline/date_picker_timeline.dart';

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
// import 'package:timelines/timelines.dart';

class PlannerScreen extends StatefulWidget {
  const PlannerScreen({Key? key}) : super(key: key);

  @override
  State<PlannerScreen> createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  int selectedTabIndex = 1; // Initially selected week tab index

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          HeaderContainer(
            height: height,
            width: width,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      const Text("07:00"),
                      _buildTimeline(height),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("08:00"),
                      _buildTimeline(height),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("09:00"),
                      _buildTimeline(height),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("10:00"),
                      _buildTimeline(height),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("11:00"),
                      _buildTimeline(height),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _buildTimeline extends StatelessWidget {
  const _buildTimeline(
    this.height, {
    super.key,
  });
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.4,
      width: 20,
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0,
        isFirst: true,
        indicatorStyle: IndicatorStyle(
          indicatorXY: 0,
          width: 15,
          indicator: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                width: 5,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        afterLineStyle: const LineStyle(
          thickness: 2,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class HeaderContainer extends StatefulWidget {
  const HeaderContainer({
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  final double height;
  final double width;
  @override
  State<HeaderContainer> createState() => _HeaderContainerState();
}

class _HeaderContainerState extends State<HeaderContainer> {
  int selectedTabIndex = 1;
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(radius: 20),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Day Planning',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'Hello, Aliakseil',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(width: 40),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromARGB(255, 32, 32, 32),
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/vector.png',
                    color: Colors.white,
                    height: 20,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromARGB(255, 32, 32, 32),
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/notification.png',
                    color: Colors.white,
                    height: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
            height: widget.height * 0.1,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 32, 32, 32),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Container(
                  width: widget.width * 0.16,
                  height: widget.height * 0.08,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset(
                    'assets/frame.png',
                    color: Colors.white,
                    height: 27,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(1.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTabIndex = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedTabIndex == 0
                                  ? Colors.green.withOpacity(0.3)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 6.0,
                              horizontal: 10.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Visibility(
                                  visible: selectedTabIndex == 0,
                                  child: Container(
                                    height: 2,
                                    width: 30,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(
                                  'day',
                                  style: TextStyle(
                                    color: selectedTabIndex == 0
                                        ? Colors.white
                                        : Colors.white70,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTabIndex = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedTabIndex == 1
                                  ? Colors.green.withOpacity(0.3)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 6.0,
                              horizontal: 10.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Visibility(
                                  visible: selectedTabIndex == 1,
                                  child: Container(
                                    height: 2,
                                    width: 30,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(
                                  'week',
                                  style: TextStyle(
                                    color: selectedTabIndex == 1
                                        ? Colors.white
                                        : Colors.white70,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTabIndex = 2;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedTabIndex == 2
                                  ? Colors.green.withOpacity(0.3)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 6.0,
                              horizontal: 10.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Visibility(
                                  visible: selectedTabIndex == 2,
                                  child: Container(
                                    height: 2,
                                    width: 30,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(
                                  'month',
                                  style: TextStyle(
                                    color: selectedTabIndex == 2
                                        ? Colors.white
                                        : Colors.white70,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTabIndex = 3;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedTabIndex == 3
                                  ? Colors.green.withOpacity(0.3)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 6.0,
                              horizontal: 10.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Visibility(
                                  visible: selectedTabIndex == 3,
                                  child: Container(
                                    height: 2,
                                    width: 30,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(
                                  'year',
                                  style: TextStyle(
                                    color: selectedTabIndex == 3
                                        ? Colors.white
                                        : Colors.white70,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: height * 0.14,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 32, 32, 32),
              borderRadius: BorderRadius.circular(20),
            ),
            child: DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.green,
              selectedTextColor: Colors.white,
              monthTextStyle: const TextStyle(color: Colors.white70),
              dateTextStyle: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              ),
              dayTextStyle: const TextStyle(color: Colors.white70),
              onDateChange: (date) {
                setState(() {
                  _selectedDate = date;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
