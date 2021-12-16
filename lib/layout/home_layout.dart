import 'package:bmi_calculater/modules/archvie_tasks/archive_tasks_screen.dart';
import 'package:bmi_calculater/modules/done_tasks/done_tasks_screen.dart';
import 'package:bmi_calculater/modules/new_tasks/new_tasks_screen.dart';
import 'package:bmi_calculater/shared/components/apptextfiled.dart';
import 'package:bmi_calculater/shared/components/constans.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex=0;
  List<Widget>Screens=[
    NewTaskScreen(),
  DoneTaskScreen(),
  ArchiveTaskScreen(),
  ];
  List<String>title=[
   'New Task',
    'Done Task',
    'Archive Task',
  ];
  @override
  void initState() {
    super.initState();
    createDataBase();
  }
  late Database database;
  var scaffoldkey=GlobalKey<ScaffoldState>();
  var formkey=GlobalKey<FormState>();
  bool isBottomSheet=false;
  IconData iconfab= Icons.edit;
  var titleTextfiled =TextEditingController();
  var timeTextfiled =TextEditingController();
  var dateTextfiled =TextEditingController();
  List<Map> tasks=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(title: Text(title[currentIndex]),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        if(isBottomSheet){
          if(formkey.currentState!.validate()) {
            insertDataBase(
              title: titleTextfiled.text,
              time: timeTextfiled.text,
              date: dateTextfiled.text,
            ).then((value) {
              Navigator.pop(context);
              isBottomSheet=false;
              setState(() {
                iconfab=Icons.edit;
              });
            });

          }
        }else {
          scaffoldkey.currentState!.showBottomSheet((context) =>
              Container(
                color: Colors.grey[100],
                padding: EdgeInsets.all(20.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppTextFiled(labelText: 'title', controller: titleTextfiled,textInputType: TextInputType.text
                        ,prefix: Icons.title,),
                      SizedBox(height: 15.00,),
                      AppTextFiled(labelText: 'time', controller: timeTextfiled,
                        textInputType: TextInputType.datetime
                        ,prefix: Icons.watch_later_outlined,
                      onTap: (){
                        showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value){
                          timeTextfiled.text=value!.format(context).toString();
                        });
                        },),
                      SizedBox(height: 15.00,),
                      AppTextFiled(labelText: 'date', controller: dateTextfiled,
                        textInputType: TextInputType.datetime
                        ,prefix: Icons.calendar_today,
                        onTap: (){
                         showDatePicker(context: context, initialDate: DateTime.now(), firstDate:  DateTime.now(), lastDate: DateTime.parse('2021-12-30')).
                         then((value) {
                           dateTextfiled.text=DateFormat.yMMMd().format(value!);
        }
                         );
                          },),
                    ],
                  ),
                ),
              )).closed.then((value) {

            isBottomSheet=false;
            setState(() {
              iconfab=Icons.edit;
            });
          });


          isBottomSheet=true;
          setState(() {
            iconfab=Icons.add;
          });

        }
        //insertDataBase();
      },
        child: Icon(iconfab),) ,
      body:Screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
       type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu),label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline),label: 'Done'),
          BottomNavigationBarItem(icon: Icon(Icons.archive_outlined ),label: 'Archvie'),
        ],
      ),
    );
  }
  void createDataBase() async{
     database = await openDatabase('todo.db',version: 1,
    onCreate: (database,version){
      print('database Created');
      database.execute('CREATE TABLE Tasks(id INTEGER primary key autoincrement,title TEXT,date Text,time TEXT,status TEXT)').
      then((value) => null).catchError((error){
        print('Error Created DataBase ${error.toString()}');
      });
    },onOpen: (database){
           getDataFromDataBase(database).then((value) {
             tasks=value;
             print(tasks);

           }
           );

           print('database Opened');

        }
    );
  }
  Future insertDataBase({required String title,required String date,required String time,}) async{
  return await  database.transaction((txn) async {
      txn.rawInsert('INSERT INTO Tasks (title , date , time , status) VALUES ("$title","$date","$time","now")').
      then((value){
        print('$value insert successfully');
      }).catchError((error){
        print('Error Created DataBase ${error.toString()}');
      });
    });
  }
  Future<List<Map>> getDataFromDataBase(database) async
  {
    return await database.rawQuery('SELECT * FROM Tasks ');


}

}
