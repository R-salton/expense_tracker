import 'package:expense_tracker/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> transactions = [
  {
    "Name": "Food",
    "Amount": 100.0,
    "Date": "2022-01-01",
    "Category": "Groceries",
    "icon": FaIcon(
      FontAwesomeIcons.burger,
      color: Colors.white,
    ),
    "color": kYellowColor,
  },
  {
    "Name": "Shoping",
    "Amount": 300.0,
    "Date": "2022-01-01",
    "icon": FaIcon(
      FontAwesomeIcons.shoppingBag,
      color: Colors.white,
    ),
    "color": Colors.purple,
  },
  {
    "Name": "Health",
    "Amount": 86.0,
    "Date": "2022-10-01",
    "icon": FaIcon(
      FontAwesomeIcons.heartPulse,
      color: Colors.white,
    ),
    "color": Colors.green,
  },
  {
    "Name": "Travel",
    "Amount": 142.0,
    "Date": "Today",
    "icon": FaIcon(
      FontAwesomeIcons.plane,
      color: Colors.white,
    ),
    "color": Colors.blue,
  },
];
