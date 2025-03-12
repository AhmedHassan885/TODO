// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:todo/core/resource_manager/app_colors.dart';
import 'package:todo/features/settings/presentations/profile2.dart';

class DefaultFormField extends StatefulWidget {
  const DefaultFormField({
    super.key,
    this.icon,
    this.labelText,
    this.height,
    this.maxLines,
    this.hint,
    this.controller,
  });

  final Widget? icon;
  final String? labelText;
  final double? height;
  final String? hint;
  final int? maxLines;
  final TextEditingController? controller;

  @override
  _DefaultFormFieldState createState() => _DefaultFormFieldState();
}

class _DefaultFormFieldState extends State<DefaultFormField> {
  final FocusNode _focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _onFieldSubmitted(String value) {
    setState(() {
      isFocused = false;
      _focusNode.unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: isFocused
              ? Border.all(
                  color: AppColors.darkGreen,
                  width: 2,
                )
              : null,
        ),
        child: SizedBox(
          height: widget.height,
          child: TextFormField(
            controller: widget.controller,
            focusNode: _focusNode,
            maxLines: widget.maxLines,
            style: const TextStyle(
              color: Color(0xff24252C),
              fontWeight: FontWeight.w200,
              fontSize: 14,
            ),
            onFieldSubmitted: _onFieldSubmitted,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: const TextStyle(
                color: Color(0xff6E6A7C),
                fontWeight: FontWeight.w200,
                fontSize: 14,
              ),
              contentPadding: const EdgeInsets.all(7),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              fillColor: Colors.white,
              filled: true,
              icon: widget.icon,
              labelText: widget.labelText,
              labelStyle: const TextStyle(
                color: Color(0xff6E6A7C),
                fontWeight: FontWeight.w400,
                fontSize: 9,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 7),
      alignment: Alignment.center,
      decoration: BoxDecoration(),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shadowColor: AppColors.darkGreen,
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
            fontSize: 19,
          ),
        ),
      ),
    );
  }
}

class DefaultRow extends StatelessWidget {
  const DefaultRow({super.key, required this.iconButton, required this.name});
  final Widget iconButton;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Profile2();
              }));
            },
            icon: Icon(Icons.person)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Hello!",
              style: TextStyle(
                  color: Color(0xff24252C),
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              name,
              style: TextStyle(
                  color: Color(0xff24252C),
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
        Spacer(),
        iconButton
      ],
    );
  }
}

class DefaulTextFormField2 extends StatelessWidget {
  const DefaulTextFormField2({
    super.key,
    required this.H,
    required this.secure, required this.controller,
  });
  final String H;
  final bool secure;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: TextFormField(
        controller: controller,
        obscureText: secure,
        decoration: InputDecoration(
            fillColor: AppColors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffCDCDCD)),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffCDCDCD)),
                borderRadius: BorderRadius.circular(12)),
            contentPadding: EdgeInsets.all(8),
            hintText: H,
            hintStyle: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 14,
                color: Color(0xff6E6A7C))),
      ),
    );
  }
}
