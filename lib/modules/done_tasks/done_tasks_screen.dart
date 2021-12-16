import 'package:flutter/material.dart';
class DoneTaskScreen extends StatefulWidget {
  const DoneTaskScreen({Key? key}) : super(key: key);

  @override
  _DoneTaskScreenState createState() => _DoneTaskScreenState();
}

class _DoneTaskScreenState extends State<DoneTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Done Task',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),));
  }
}
