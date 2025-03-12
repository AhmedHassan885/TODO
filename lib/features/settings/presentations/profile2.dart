import 'package:flutter/material.dart';
import 'package:todo/features/opening_page/presentations/registerr.dart';
import 'package:todo/features/settings/presentations/settings.dart';
import 'package:todo/features/settings/presentations/widgets/default_container.dart';

class Profile2 extends StatelessWidget {
  const Profile2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
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
                        fontFamily: "Lexend Deca",
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "Ahmed Hassan",
                    style: TextStyle(
                        color: Color(0xff24252C),
                        fontFamily: "Lexend Deca",
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Register();
                }));
              },
              child: DefaultContainer(
                  icon: Icon(Icons.person), title: "Update Profile")),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Register();
                }));
              },
              child: DefaultContainer(
                  icon: Icon(Icons.lock), title: "Change Password")),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Settings();
                }));
              },
              child: DefaultContainer(
                  icon: Icon(Icons.settings), title: "Settings")),
        ],
      ),
    );
  }
}
