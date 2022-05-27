import 'package:flutter/material.dart';
import 'package:inovola_task/course/ui/course_page.dart';
import 'package:inovola_task/utils/app_colors.dart';
import 'package:inovola_task/utils/dimensions_initializer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inovola Task',
      debugShowCheckedModeBanner: false,
      color: AppColors.appBackgroundColor,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor
      ),
      locale: const Locale("ar"),
      supportedLocales: const [Locale("ar"), Locale("en")],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const DimensionsInitializer(child: CoursePage()),
    );
  }
}
