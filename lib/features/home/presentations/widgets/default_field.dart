import 'package:flutter/material.dart';
import 'package:todo/core/resource_manager/app_colors.dart';

class DefaultField extends StatelessWidget {
  const DefaultField(
      {super.key,
      required this.icon,
      required this.title,
      required this.color1,
      required this.color2,
      required this.num});
  final Widget icon;
  final String title;
  final Color color1;
  final Color color2;
  final String num;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          icon,
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              color: AppColors.text_black,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          Spacer(),
          Container(
            width: 20,
            height: 18,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color1,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              num,
              style: TextStyle(color: color2),
            ),
          )
        ],
      ),
    );
  }
}