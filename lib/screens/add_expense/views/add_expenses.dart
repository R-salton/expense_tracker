import 'package:expense_tracker/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpensesScreen extends StatefulWidget {
  const AddExpensesScreen({super.key});

  @override
  State<AddExpensesScreen> createState() => _AddExpensesScreenState();
}

class _AddExpensesScreenState extends State<AddExpensesScreen> {
  TextEditingController expenseAmountController = TextEditingController();
  String? selectedCategory;
  TextEditingController expenseNoteController = TextEditingController();
  TextEditingController expenseDateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    expenseDateController.text =
        DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

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
                    child: TextField(
                      controller: expenseAmountController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            FontAwesomeIcons.dollarSign,
                            size: 18,
                            color: const Color(0x9EEEECEC),
                          ),
                          labelText: "Amount",
                          labelStyle: TextStyle(
                              color: const Color(0x9EEEECEC),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color(0x78EBEBEB), width: 2.0),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField<String>(
                    value: selectedCategory,
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value;
                      });
                    },
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
                      prefixIcon: Icon(
                        FontAwesomeIcons.list,
                        size: 18,
                        color: const Color(0x9EEEECEC),
                      ),
                      labelText: 'Category',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: expenseNoteController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          FontAwesomeIcons.pen,
                          size: 18,
                          color: const Color(0x9EEEECEC),
                        ),
                        labelText: "Note",
                        labelStyle: TextStyle(
                            color: const Color(0x9EEEECEC),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0x78EBEBEB), width: 2.0),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    controller: expenseDateController,
                    readOnly: true,
                    onTap: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(1990),
                          lastDate: DateTime(2027),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                primaryColor: kTextColor, // Header color
                                colorScheme: ColorScheme.light(
                                  primary:
                                      Colors.blue, // Header background color
                                  onPrimary: kTextColor, // Header text color
                                  onSurface: kTextColor, // Dates text color
                                ),
                                textTheme: TextTheme(
                                  bodyMedium: TextStyle(
                                      color:
                                          kLightBlueColor), // Dates text color
                                ),
                                dialogBackgroundColor: Colors
                                    .black, // Background color of the dialog
                              ),
                              child: child!,
                            );
                          });

                      if (newDate != null) {
                        setState(
                          () {
                            expenseDateController.text =
                                DateFormat("dd/MM/yyyy").format(newDate);
                            selectedDate = newDate;
                          },
                        );
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          FontAwesomeIcons.clock,
                          size: 18,
                          color: const Color(0x9EEEECEC),
                        ),
                        labelText: "Date",
                        labelStyle: TextStyle(
                            color: const Color(0x9EEEECEC),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0x78EBEBEB), width: 2.0),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        )),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kLightBlueColor,
                  borderRadius: BorderRadius.circular(12.0),
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
