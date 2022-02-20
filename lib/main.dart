import 'package:flutter/material.dart';
import 'package:quiz_app/constants/app_colors.dart';

import 'package:quiz_app/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: AppColors.scaffoldBGColor,
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: HomeScreen(),
            ))));
  }
}
