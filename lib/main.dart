import 'package:flutter/material.dart';
import 'package:instagram_clone_task_3/screens/home_page.dart';
import 'package:instagram_clone_task_3/theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: MyAppTheme.lightTheme,
      home: HomePage(),
    );
  }
}
