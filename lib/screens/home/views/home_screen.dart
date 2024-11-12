import 'dart:math';

import 'package:expense_tracker/components/constants.dart';
import 'package:expense_tracker/screens/home/views/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
            backgroundColor: kLightBlueColor,
            iconSize: 25,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.graph_square), label: "Statistics"),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: kTextColor,
          shape: CircleBorder(),
          child: Container(
              width: 60,
              height: 60,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Icon(
                Icons.add,
                color: kTextColor,
              )),
          onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: MainScreen(),
    );
  }
}
