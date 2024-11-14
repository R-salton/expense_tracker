import 'package:expense_tracker/components/constants.dart';
import 'package:expense_tracker/screens/add_expense/views/add_expenses.dart';
import 'package:expense_tracker/screens/home/views/main_screen.dart';
import 'package:expense_tracker/screens/stats_screen/stats_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var ScreenIndex = 0;
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
            onTap: (value) {
              setState(() {
                ScreenIndex = value;
              });
            },
            currentIndex: ScreenIndex,
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
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddExpensesScreen()));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ScreenIndex == 0 ? MainScreen() : StatScree(),
    );
  }
}
