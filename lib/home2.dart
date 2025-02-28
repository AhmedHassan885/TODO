import 'package:flutter/material.dart';
import 'package:todo/add_task.dart';
import 'package:todo/config/Default.dart';
import 'package:todo/config/app_colors.dart';
import 'package:todo/profile2.dart';

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        children: [
          SizedBox(height: 10,),
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
            height: 20,
          ),
          Container(
            width: 400,
            height: 140,
            decoration: BoxDecoration(
                color: AppColors.darkGreen,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your today’s tasks\nalmost done!",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Lexend Deca",
                        color: AppColors.white),
                  ),
                  Row(
                    children: [
                      Text(
                        "80",
                        style: TextStyle(
                            fontFamily: "Lexend Deca",
                            fontWeight: FontWeight.w400,
                            fontSize: 40,
                            color: AppColors.white),
                      ),
                      Text(
                        "%",
                        style: TextStyle(
                            fontFamily: "Lexend Deca",
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            color: AppColors.white),
                      ),
                      Spacer(),
                      Container(
                        alignment: Alignment.center,
                        width: 120,
                        height: 35,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          "View Tasks",
                          style: TextStyle(
                              fontFamily: "Lexend Deca",
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkGreen),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 25),
            child: Row(
              children: [
                Text(
                  "In Progress",
                  style: TextStyle(
                      fontFamily: "Lexend Deca",
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff24252C)),
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 15,
                  height: 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.teal[100],
                  ),
                  child: Text(
                    "5",
                    style: TextStyle(color: AppColors.darkGreen),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 85,
              width: 400,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  DefaultCont(
                      text1: "Work Task",
                      color1: AppColors.white,
                      color2: Colors.black,
                      color3: AppColors.darkGreen,
                      color4: AppColors.white,
                      icon: Icon(
                        Icons.badge,
                        color: AppColors.white,
                        size: 15,
                      ),
                      text2: "Add New Features"),
                  SizedBox(
                    width: 20,
                  ),
                  DefaultCont(
                      text1: "Personal Task",
                      color1: Color(0xff6E6A7C),
                      color2: Color(0xffCEEBDC),
                      color3: AppColors.darkGreen,
                      color4: Color(0xff24252C),
                      icon: Icon(
                        Icons.person,
                        color: Colors.grey[300],
                        size: 20,
                      ),
                      text2: "Improve my English skills \nby trying to speek"),
                  SizedBox(
                    width: 20,
                  ),
                  DefaultCont(
                      text1: "Home Task",
                      color1: Color(0xff6E6A7C),
                      color2: Color(0xffFFE4F2),
                      color3: Colors.pinkAccent,
                      color4: Color(0xff24252C),
                      icon: Icon(
                        Icons.house,
                        color: AppColors.white,
                        size: 15,
                      ),
                      text2: "Add new feature for Do It \napp and commit it"),
                  SizedBox(
                    width: 20,
                  ),
                ],
              )),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 25),
            child: Row(
              children: [
                Text(
                  "Task Groups",
                  style: TextStyle(
                      color: Color(0xff24252C),
                      fontWeight: FontWeight.w300,
                      fontFamily: "Lexend Deca",
                      fontSize: 14),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          DefaultField(
              icon: Icon(
                Icons.person,
                color: AppColors.darkGreen,
              ),
              title: "Personal Task",
              color1: Color(0xffCEEBDC),
              color2: AppColors.darkGreen,
              num: "5"),
          SizedBox(
            height: 15,
          ),
          DefaultField(
              icon: Icon(
                Icons.house,
                color: Colors.pink,
              ),
              title: "Home Task",
              color1: Color(0xffFFE4F2),
              color2: Colors.pink,
              num: "3"),
          SizedBox(
            height: 15,
          ),
          DefaultField(
              icon: Icon(
                Icons.badge,
                color: Colors.black,
              ),
              title: "Work Task",
              color1: Colors.black,
              color2: AppColors.white,
              num: "1")
        ],
      ),
    );
  }
}
