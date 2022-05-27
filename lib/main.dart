import 'package:flutter/material.dart';
import 'package:inovola_task/course/ui/course_page.dart';
import 'package:inovola_task/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      color: AppColors.appBackgroundColor,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CoursePage(),
    );
  }
}
