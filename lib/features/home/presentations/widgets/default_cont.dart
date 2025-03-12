import 'package:flutter/material.dart';

class DefaultCont extends StatelessWidget {
  const DefaultCont(
      {super.key,
      required this.text1,
      required this.color1,
      required this.color2,
      required this.color3,
      required this.icon,
      required this.text2,
      required this.color4});
  final String text1;
  final String text2;

  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: 260,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: color2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text1,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w400, color: color1),
              ),
              Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: color3),
                child: icon,
              )
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            text2,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w300, color: color4),
          )
        ],
      ),
    );
  }
}