import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screen/HomeScreen.dart';
void main() {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Color(0xFF4044C9),
  //   statusBarIconBrightness: Brightness.light,
  // ));
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}
