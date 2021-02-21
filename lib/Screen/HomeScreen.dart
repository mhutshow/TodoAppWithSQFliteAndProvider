import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool checkBox = false;
  DateFormat date = DateFormat('d MMM');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4044C9),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                color: Color(0xFF4044C9),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.blur_on,
                          color: Colors.white,
                          size: 40,
                        ),
                        Text(
                          date.format(DateTime.now()),
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        Icon(
                          Icons.alarm,
                          color: Colors.white,
                          size: 40,
                        ),
                      ],
                    ),
                    SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Today',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40)),
                            Text('  8 tasks',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                          ],
                        ),
                        Container(
                          height: 60,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(70)),
                          ),
                          child: Center(
                              child: Text('Add Task',
                                  style: TextStyle(
                                      color: Color(0xFF4044C9),
                                      fontSize: 22))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(70)),
              ),
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Row(
                      children: [
                        DayNameBuilder(dayName: 'SAT \nDAY'),
                        DayNameBuilder(dayName: 'SUN \nDAY'),
                        DayNameBuilder(dayName: 'MON \nDAY'),
                        DayNameBuilder(dayName: 'TUE \nDAY'),
                        DayNameBuilder(dayName: 'WED \nDAY'),
                        DayNameBuilder(dayName: 'THU \nDAY'),
                        DayNameBuilder(dayName: 'FRI \nDAY'),
                      ],
                    );
                  }
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${(index).toString()}. Make tutorial video ',
                                  style: TextStyle(fontSize: 25),
                                ),
                                Text(
                                  'Feb 10, 2021__Priority High',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                              ],
                            ),
                            CircularCheckBox(
                                inactiveColor: Color(0xFF4044C9),
                                value: checkBox,
                                activeColor: Color(0xFF4044C9),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.padded,
                                onChanged: (bool x) {
                                  setState(() {});
                                  checkBox = !checkBox;
                                }),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DayNameBuilder extends StatelessWidget {
  DayNameBuilder({this.dayName});
  final String dayName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, bottom: 20),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Color(0xFF4044C9),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
            child: Text(
          dayName,
          style: TextStyle(color: Colors.white, fontSize: 10),
        )),
      ),
    );
  }
}
