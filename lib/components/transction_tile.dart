import 'package:expense_tracker/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ExpenseTile extends StatelessWidget {
  const ExpenseTile({
    super.key,
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
                height: 35,
                width: 35,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                child: Icon(LineIcons.pizzaSlice),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Food",
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
                "-\$ 200",
                style: TextStyle(
                    color: kRedColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Today",
                style: TextStyle(color: Colors.white60, fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
