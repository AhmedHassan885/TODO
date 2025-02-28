import 'package:flutter/material.dart';
import 'package:todo/add_task.dart';
import 'package:todo/config/app_asset.dart';
import 'package:todo/profile2.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Add_task();
                    }));
                  },
                  icon: Icon(Icons.add_outlined))
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            "There are no tasks yet,\n      Press the button\n      To add New Task ",
            style: TextStyle(
                fontSize: 16,
                fontFamily: "Lexend Deca",
                fontWeight: FontWeight.w300,
                color: Color(0xff24252C)),
          ),
          SizedBox(
            height: 55,
          ),
          Image.asset(AppAsset.person_imae)
        ],
      ),
    );
  }
}
