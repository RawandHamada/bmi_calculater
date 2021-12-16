import 'dart:math';

import 'package:bmi_calculater/modules/bmi_results/bmi_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale=true;
  double height=220;
  int weight =40;
  int age =20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('BMI Calculator'),),
      body: Column(
        children: [
          Expanded(
            child: Container(width:double.infinity
              ,color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap:(){
                          setState(() {
                            isMale=true;
                          });

                        },
                        child: Container(
                         // color: isMale ? Colors.grey.shade400 :Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Image(image: AssetImage('images/male.png'),height:90.00,width: 90.00,),
                              SizedBox(height: 15,),
                              Text('Male',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25.00),),
                            ],

                          ),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.00),color: isMale ?Colors.blue :Colors.grey.shade400),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.00),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale=false;
                          });
                        },
                        child: Container(
                          //color:  Colors.blue :Colors.grey.shade400,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Image(image: AssetImage('images/woman.png'),height:90.00,width: 90.00,),
                              SizedBox(height: 15,),
                              Text('FeMale',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25.00),),
                            ],
                          ),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.00),color: isMale ? Colors.grey.shade400:Colors.blue ),

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child:
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.00),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.00),color: Colors.grey.shade400),
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Text('HEIGHT',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25.00),),
                        Row(

                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text('${height.round()}',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black,fontSize: 25.00),),
                            SizedBox(width: 5.00,),
                            Text('cm',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20.00),),
                          ],),
                        Slider(value: height,
                            max: 220.0,
                            min:80.0 ,
                            onChanged: (value){
                          setState(() {
                            height=value;
                          });
                              print(value.round());
                            }),

                      ],),
                    ),
                  )),
          Expanded(child:
              Padding(
                padding: const EdgeInsets.all(20.00),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.00),color: Colors.grey.shade400),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black,fontSize: 25.00),),
                            Text('$age',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black,fontSize: 25.00),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },heroTag:'ager',mini: true,child: Icon(Icons.remove),),
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },heroTag:'agea',mini: true,child: Icon(Icons.add),),
                              ],
                            )


                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20.00,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.00),color: Colors.grey.shade400),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text('Weight',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black,fontSize: 25.00),),
                            Text('$weight',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black,fontSize: 25.00),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },heroTag: 'weightr',mini: true,child: Icon(Icons.remove),),
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    weight++;
                                  });

                                },heroTag:'weighta',mini: true,child: Icon(Icons.add),),
                              ],
                            )


                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              )
          ),
          Container(
            width:double.infinity ,
            color: Colors.blue,
            child: MaterialButton(onPressed: (){
              var result=weight/pow(height/100,2);
              print(result.round());
              Navigator.push(context, MaterialPageRoute(builder: (context)=> BmiResult(
                isMale:isMale,
                age:age,
                result:result.round(),
              )));
            },
                    height: 50.00,
              color: Colors.blue,
                    child:Text('Calculator',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,),),),
          )

        ],
      ),
    );
  }
}
