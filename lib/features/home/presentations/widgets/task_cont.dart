import 'package:flutter/material.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({super.key, required this.title, required this.desc});
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 400,
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 11),
      decoration: BoxDecoration(
          color: Color(0xffCEEBDC), borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xff6E6A7C)),
              ),
              Spacer(),
              Text(
                "11/03/2025\n   05:00 PM",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xff6E6A7C)),
              )
            ],
          ),
          Text(
            desc,
            style: TextStyle(
                fontWeight: FontWeight.w300, fontSize: 14, color: Colors.black),
          )
        ],
      ),
    );
  }
}
