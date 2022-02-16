import 'package:flutter/material.dart';

Widget currentWeather(String con, var temp, String location) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        SizedBox(
          height: 150,
        ),

        Row(
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text(
              "${temp.toString().substring(0,2)}",
              style: TextStyle(fontSize: 46),
            ),
            Text("c")
          ],
        ),
        SizedBox(height: 10,),
        Text("$con"),

        Text(
          "$location",
          style: TextStyle(fontSize: 18, color: Color(0xFF5a5a5a)),
        ),
      ],
    ),
  );
}
