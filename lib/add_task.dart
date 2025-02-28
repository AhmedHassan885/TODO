// ignore_for_file: camel_case_types, avoid_print
import 'package:flutter/material.dart';
import 'package:todo/config/Default.dart';
import 'package:todo/config/app_colors.dart';
import 'package:todo/home2.dart';

class Add_task extends StatelessWidget {
  Add_task({super.key});

  final List<String> dropdownItems = ["Home", "Work", "Personal"];
  final List<Widget> dropdownIcons = [
    Icon(
      Icons.house,
      color: Colors.pink,
    ),
    Icon(
      Icons.work,
      color: Colors.black,
    ),
    Icon(Icons.person, color: AppColors.darkGreen),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text(
          "Add Task",
          style: TextStyle(
              fontFamily: "Lexend Deca",
              fontSize: 19,
              fontWeight: FontWeight.w300,
              color: Color(0xff24252C)),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 65,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Task Group",
                    labelStyle: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Lexend Deca",
                        color: Color(0xff6E6A7C))),
                borderRadius: BorderRadius.circular(15),
                icon: Icon(Icons.keyboard_arrow_down_rounded),
                padding: EdgeInsets.symmetric(horizontal: 3),
                alignment: Alignment.centerLeft,
                isExpanded: true,
                itemHeight: 55,
                hint: Text(
                  "Select task group",
                  style: TextStyle(
                    color: AppColors.text_black,
                    fontFamily: "Lexend Deca",
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                items: dropdownItems.asMap().entries.map((entry) {
                  int index = entry.key;
                  String text = entry.value;

                  return DropdownMenuItem(
                    value: text,
                    child: Row(
                      children: [
                        CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.grey[200],
                            child: dropdownIcons[index]),
                        SizedBox(width: 15),
                        Text(text)
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (entry) {
                  print(entry);
                },
              ),
            ),
          ),
          DefaultFormField(
            hint: "Enter task name",
            labelText: "Task Name",
          ),
          DefaultFormField(
            max_lines: 5,
            hint: "Enter task description . . . ",
            labelText: "Description",
          ),
          Button(text: "Save", destination: Home2())
        ],
      ),
    );
  }
}
