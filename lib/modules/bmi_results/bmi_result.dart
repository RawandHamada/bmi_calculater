import 'package:flutter/material.dart';
class BmiResult extends StatelessWidget {
  final int result;
  final bool isMale;
  final  int age;


  BmiResult({required this.result, required this.isMale, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI RESULT'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gender :${isMale ? 'Male' :'Female'}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
            Text('Result :$result',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
            Text('Age :$age',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),

        ],),
      ),
    );
  }
}
