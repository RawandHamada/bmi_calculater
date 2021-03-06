import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter'),),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              setState(() {
                counter--;
                print(counter);
              });

            }, child: Text('Minus')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.00),
              child: Text('${counter}',style: TextStyle(fontSize: 30.00,fontWeight: FontWeight.bold),),
            ),
            TextButton(onPressed: (){
              setState(() {
                counter++;
                print(counter);
              });

            }, child: Text('Plus')),

          ],
        ),
      ),
    );
  }
}
