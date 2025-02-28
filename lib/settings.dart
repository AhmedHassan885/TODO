import 'package:flutter/material.dart';
import 'package:todo/config/app_colors.dart';
import 'package:todo/profile2.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<StatefulWidget> createState() => _MySettingsState();
}

class _MySettingsState extends State<Settings> {
  bool status = true;
  bool status2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () { Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Profile2();
                    }));}, icon: Icon(Icons.arrow_back_ios_new_rounded)),
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w300,
              fontFamily: "Lexend Deca",
              color: Color(0xff24252C)),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  "Notification",
                  style: TextStyle(
                      color: Color(0xff24252C),
                      fontFamily: "Lexend Deca",
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                ),
                Spacer(),
                Switch(
                    activeTrackColor: AppColors.darkGreen,
                    value: status,
                    onChanged: (val) {
                      setState(() {
                        status = val;
                      });
                    })
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  "Enable Cloud",
                  style: TextStyle(
                      color: Color(0xff24252C),
                      fontFamily: "Lexend Deca",
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                ),
                Spacer(),
                Checkbox(
                    activeColor: AppColors.darkGreen,
                    value: status2,
                    onChanged: (val) {
                      setState(() {
                        status2 = val!;
                      });
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
