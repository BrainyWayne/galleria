import 'package:flutter/material.dart';
import 'package:galleria/main.dart';

Widget appBar(String title, String title2, IconData icon1, IconData icon2){
  return Container(
    decoration: BoxDecoration(
      color: darkMode ? Colors.black : Colors.white,
    ),
    padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
    child: SafeArea(
      child: Stack(
        children: [
          Row(
            children: [
              Text(title, style: TextStyle(fontSize: 30),),
              Text(title2, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              Spacer(),
              Icon(icon1, size: 30,),
              SizedBox(width: 20),
              Icon(icon2, size: 30,)
            ],
          ),
        ],
      ),
    ),
  );
}