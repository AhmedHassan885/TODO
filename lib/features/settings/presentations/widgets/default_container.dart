import 'package:flutter/material.dart';
import 'package:todo/core/resource_manager/app_colors.dart';

class DefaultContainer extends StatelessWidget {
  const DefaultContainer({super.key, required this.icon, required this.title});
  final Widget icon;
  final String title;

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
          Icon(Icons.arrow_forward_ios_rounded)
        ],
      ),
    );
  }
}