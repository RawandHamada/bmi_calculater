import 'package:flutter/material.dart';
class ArchiveTaskScreen extends StatefulWidget {
  const ArchiveTaskScreen({Key? key}) : super(key: key);

  @override
  _ArchiveTaskScreenState createState() => _ArchiveTaskScreenState();
}

class _ArchiveTaskScreenState extends State<ArchiveTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Archive Task',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),));
  }
}
