import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String taskName;
  DateTime taskTime;
  String priority;
  DateTime taskDate=DateTime.now();
  TextEditingController dateController= TextEditingController();
  List<String> priorities=['Low','Medium','High'];

  datePicker() async{
    final DateTime date= await showDatePicker(
      context: context,
      initialDate: taskDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    );
    setState(() {
      taskDate=date;
    });
    dateController.text= dateFormat.format(date);
  }
  DateFormat dateFormat = DateFormat('dd MMM,yyyy');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
               child: Icon(Icons.arrow_back_ios , size: 40,),
              ),
              SizedBox(
                height: 120,
              ),
              Text('Create new task' , style: TextStyle(fontWeight: FontWeight.bold ,fontSize:40 ),),
              SizedBox(
                height: 30,
              ),
              TextField(
                onChanged: (value) {
                    taskName=value;
                },
                decoration: InputDecoration(
                  labelText: 'Task Name',
                  labelStyle: TextStyle(fontSize: 18 ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                onTap: datePicker,
                controller: dateController,
                decoration: InputDecoration(
                  labelText: 'Date',
                  labelStyle: TextStyle(fontSize: 18 ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              DropdownButtonFormField(
                icon: Icon(Icons.arrow_drop_down_circle),
                items: priorities.map((String priority) {
                  return DropdownMenuItem(
                    value: priority,
                    child: Text(priority),
                  );
                }).toList(),
               onChanged: (value) {
                 priority=value;
                 print(priority);
               },
                decoration: InputDecoration(
                  labelText: 'Priority',
                  labelStyle: TextStyle(fontSize: 18 ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              FlatButton(
                onPressed: (){

                },
                padding: EdgeInsets.zero,
                child: Container(
                  height: 60,
                  width: double.infinity-30,
                  decoration: BoxDecoration(
                    color: Color(0xFF4044C9),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Center(child: Text('Add' , style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),)),
                ),
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}
