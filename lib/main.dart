import 'package:flutter/material.dart';
import 'package:gym_new_app/utils/const_colors.dart';
import 'package:gym_new_app/modules/home/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GymApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColors,
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}
