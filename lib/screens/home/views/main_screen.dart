import 'dart:math';

import 'package:expense_tracker/components/constants.dart';
import 'package:expense_tracker/components/transction_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icon_craft/icon_craft.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:simple_icons/simple_icons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: kIconColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 2,
                    color: const Color(0x84000000),
                    offset: Offset(0, 4),
                  )
                ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 58, // Increased height and width for border
                          width: 58,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFFAF9F7), // Yellow
                                Color(0xFF5EA2FC), // Orange
                                Color(0xFFFDFDFD), // Pink
                                Color(0xFF8134AF), // Purple
                                Color(0xFF515BD4), // Blue
                              ],
                            ),
                          ),
                          child: Center(
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kYellowColor,
                              ),
                              child: Icon(LineIcons.user),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Welocme!",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Text(
                          "Sadev Salton",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.settings,
                      color: kTextColor,
                      size: 20,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Total Balance",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xD5205EA1),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    "\$ 2000.0",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ExpenseIncomeBtn(
                      amount: 2450,
                      title: "Income",
                      icon: Icons.arrow_upward,
                      color: const Color(0xFF2A5F2C),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    ExpenseIncomeBtn(
                      amount: 120,
                      title: "Expenses",
                      icon: Icons.arrow_downward,
                      color: const Color(0xFFAD3C34),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transactions",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                      color: Colors.white54, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ExpenseTile(),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ExpenseIncomeBtn extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final double amount;

  const ExpenseIncomeBtn({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xB99E9E9E),
              ),
              child: Icon(icon, color: color, size: 20)),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                "\$ $amount",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
