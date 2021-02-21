import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_with_sqflite_provider/Screen/AddTaskScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dayName='sat';
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
                              child: FlatButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder:(context) => AddTaskScreen(), ));
                                },
                                child: Text('Add Task',
                                    style: TextStyle(
                                        color: Color(0xFF4044C9),
                                        fontSize: 22)),
                              )),
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
                        DayNameBuilder(
                            dayName: 'SAT \nDAY',
                          color: dayName=='sat'? Color(0xFF4044C9): Color(0xFF405669),

                        ),
                        DayNameBuilder(dayName: 'SUN \nDAY' , color: dayName=='sun'? Color(0xFF4044C9) : Color(0xFF405669),

                        ),
                        DayNameBuilder(dayName: 'MON \nDAY', color: dayName=='mon'? Color(0xFF4044C9): Color(0xFF405669),),
                        DayNameBuilder(dayName: 'TUE \nDAY',  color: dayName=='tue'? Color(0xFF4044C9): Color(0xFF405669),),
                        DayNameBuilder(dayName: 'WED \nDAY', color: dayName=='wed'? Color(0xFF4044C9): Color(0xFF405669),),
                        DayNameBuilder(dayName: 'THU \nDAY' , color: dayName=='thu'? Color(0xFF4044C9): Color(0xFF405669),),
                        DayNameBuilder(dayName: 'FRI \nDAY' , color: dayName=='fri'? Color(0xFF4044C9): Color(0xFF405669),),
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
  DayNameBuilder({this.dayName, this.color});
  final String dayName;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, bottom: 20),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: color,
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
