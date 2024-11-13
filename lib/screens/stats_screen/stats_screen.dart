import 'package:expense_tracker/components/constants.dart';
import 'package:expense_tracker/screens/stats_screen/chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StatScree extends StatefulWidget {
  const StatScree({super.key});

  @override
  State<StatScree> createState() => _StatScreeState();
}

class _StatScreeState extends State<StatScree> {
  bool isEnabledIncome = false;
  bool isEnabledExpenses = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: kBlackCleanColor, shape: BoxShape.circle),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => StatScree(),
                          //   ),
                          // );
                        },
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.arrowLeft,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Transactions",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: kBlackCleanColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: FaIcon(FontAwesomeIcons.bars,
                        size: 18, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 50,
            decoration: BoxDecoration(
              color: kLightBlueColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      isEnabledIncome = !isEnabledIncome;
                      isEnabledExpenses = !isEnabledExpenses;
                    }),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      height: 40,
                      decoration: BoxDecoration(
                          color:
                              isEnabledIncome ? kTextColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(13)),
                      child: Center(
                        child: Text(
                          "Income",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isEnabledExpenses = !isEnabledExpenses;
                        isEnabledIncome = !isEnabledIncome;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      height: 40,
                      decoration: BoxDecoration(
                          color: isEnabledExpenses
                              ? kTextColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(13)),
                      child: Center(
                        child: Text(
                          "Expenses",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kLightBlueColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "01 Jan 2024 - 01 April 2024",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "\$ 35000.00",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(child: MyChart())
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
