import 'package:expense_tracker/components/constants.dart';
import 'package:expense_tracker/screens/home/views/home_screen.dart';
import 'package:flutter/material.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expense Tracker",
      theme: ThemeData(
        colorScheme: ColorScheme.light(
            surface: kTextColor,
            onSurface: Colors.black,
            primary: Color(0xFFe7f3ff),
            secondary: Color(0xFF205fa1),
            tertiary: Color(0xFF82bbf6),
            
            ),
      ),
      home: HomeScreen(),
    );
  }
}
