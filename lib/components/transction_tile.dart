import 'package:expense_tracker/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExpenseTile extends StatelessWidget {
  final String title;
  final String day;
  final double amount;
  final FaIcon icon;
  final Color color;

  const ExpenseTile({
    super.key,
    required this.title,
    required this.day,
    required this.icon,
    required this.color,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 70,
      decoration: BoxDecoration(
        color: kBlackCleanColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                child: Center(child: icon),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "-\$ $amount",
                style: TextStyle(
                    color: kRedColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                day,
                style: TextStyle(color: Colors.white60, fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
