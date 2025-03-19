import 'package:flutter/material.dart';
import 'package:todo/features/home/data/models/task_model.dart';

class AddedTask extends StatelessWidget {
  const AddedTask({super.key, required this.task});

  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 90,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xffCEEBDC),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                task.title ?? '',
                style: TextStyle(
                  color: Color(0xff6E6A7C),
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              Spacer(),
              Text(
                task.createdAt ?? '',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff6E6A7C)),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(task.description ?? '',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff24252C))),
        ],
      ),
    );
  }
}
