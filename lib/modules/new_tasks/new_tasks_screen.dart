import 'package:bmi_calculater/shared/components/compontes.dart';
import 'package:bmi_calculater/shared/components/constans.dart';
import 'package:flutter/material.dart';
class NewTaskScreen extends StatelessWidget {
   final List<Map>? tasks;

  const NewTaskScreen({Key? key, this.tasks}) : super(key: key);
    //NewTaskScreen({ this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context,index)=> buildtaskItem(),
        separatorBuilder:  (context,index)=>
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(width: double.infinity,
                height: 1.00,
                color: Colors.grey[300],),
            ), itemCount: 10);
  }
}
