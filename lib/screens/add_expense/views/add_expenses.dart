import 'package:expense_tracker/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddExpensesScreen extends StatelessWidget {
  const AddExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'Groceries',
      'Bills',
      'Entertainment',
      'Transport',
      'Health',
      'Others',
    ];

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Add Expenses',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: CustomInputField(
                      prefixIcon: FontAwesomeIcons.dollarSign,
                      labelText: "Amount",
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField<String>(
                    onChanged: (value) {},
                    items: categories.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(
                          category,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'Category',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    prefixIcon: FontAwesomeIcons.pen,
                    labelText: "Note",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    prefixIcon: FontAwesomeIcons.calendar,
                    labelText: "Today",
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kLightBlueColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "SAVE",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;

  const CustomInputField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            size: 18,
            color: const Color(0x9EEEECEC),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
              color: const Color(0x9EEEECEC),
              fontSize: 16,
              fontWeight: FontWeight.bold),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color(0x78EBEBEB), width: 2.0),
            borderRadius: BorderRadius.circular(30.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          )),
    );
  }
}
