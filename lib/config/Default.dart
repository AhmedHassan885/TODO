// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo/config/app_colors.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField(
      // ignore: non_constant_identifier_names
      {super.key,
      this.icon,
      this.labelText,
      this.height,
      // ignore: non_constant_identifier_names
      this.max_lines,
      this.hint});
  final Widget? icon;
  final String? labelText;
  final double? height;
  final String? hint;
  // ignore: non_constant_identifier_names
  final int? max_lines;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: SizedBox(
            height: height,
            child: TextFormField(
              maxLines: max_lines,
              style: TextStyle(
                  color: Color(0xff24252C),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Lexend Deca",
                  fontSize: 14),
              decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                      color: Color(0xff6E6A7C),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Lexend Deca",
                      fontSize: 14),
                  contentPadding: EdgeInsets.all(7),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  icon: icon,
                  labelText: labelText,
                  labelStyle: TextStyle(
                      color: Color(0xff6E6A7C),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Lexend Deca",
                      fontSize: 9)),
            ),
          ),
        ));
  }
}

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
              fontFamily: "Lexend Deca",
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

class Button extends StatelessWidget {
  final String text;
  final Widget destination;

  const Button({
    super.key,
    required this.text,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 7),
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 155, vertical: 10),
          elevation: 7,
          backgroundColor: AppColors.darkGreen,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontFamily: "Lexend Deca",
            fontSize: 19,
          ),
        ),
      ),
    );
  }
}

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
                    fontFamily: "Lexend Deca",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: color1),
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
                fontFamily: "Lexend Deca",
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: color4),
          )
        ],
      ),
    );
  }
}

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
              fontFamily: "Lexend Deca",
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

class Data {
  late String name;
  Data({required this.name});
}
