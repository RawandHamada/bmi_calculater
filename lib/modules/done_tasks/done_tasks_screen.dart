import 'package:bmi_calculater/cubit/cubit_.dart';
import 'package:bmi_calculater/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class DoneTaskScreen extends StatefulWidget {
  const DoneTaskScreen({Key? key}) : super(key: key);

  @override
  _DoneTaskScreenState createState() => _DoneTaskScreenState();
}

class _DoneTaskScreenState extends State<DoneTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppStats>(
      listener: (context, state) {},
      builder: (context, state)
      {
        if(NewsCubit.get(context).doneTasks.isEmpty)
        {
          return Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
              [
                Icon(Icons.menu,color: Colors.grey,size: 100,),
                Text('NO TASKS ',style: TextStyle(fontSize: 40,color: Colors.grey),)
              ],
            ),
          );
        }else
        {
          return Text('data');
          /*return ListView.separated(
            itemBuilder: (context, index) => buildTaskItem(NewsCubit.get(context).doneTasks[index],context),
            separatorBuilder: (context, index) => Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[300],
            ),
            itemCount:NewsCubit.get(context).doneTasks.length,
          );*/
        }
      },
    );
  }
}
