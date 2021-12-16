import 'package:flutter/material.dart';

Widget defaultButton({required double width,
  required Color background,
  required String text,
  bool isUseUpr=true,
  double radius=0.0,
  required Function() onPressed,
})=>
    Container(
    width:width,
    color: background,
    child: MaterialButton(
      onPressed: onPressed
      ,child:Text(isUseUpr ?text.toUpperCase() : text,
        style: const TextStyle(color: Colors.white),),));


Widget buildtaskItem() => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      CircleAvatar(
        child: Text('2.30 pm'),
        radius: 40.00,),
      SizedBox(width: 20.00,),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('TaskTitle',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          SizedBox(height: 10,),
          Text('2 Arpile ,2021'),
        ],
      ),
    ],
  ),
);
