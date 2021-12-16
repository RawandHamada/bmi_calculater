import 'package:flutter/material.dart';
class UserModel{
   final int id;
    final String phone;
    final String name;
UserModel({
 required this.id,
  required this.phone,
  required this.name,


});
}
class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<UserModel> users =[
    UserModel(id: 1, phone: '0592425660', name: 'rawan'),
    UserModel(id: 2, phone: '0592425660', name: 'rawan'),
    UserModel(id: 3, phone: '0592425660', name: 'rawan'),
    UserModel(id: 4, phone: '0592425660', name: 'rawan'),
    UserModel(id: 5, phone: '0592425660', name: 'rawan'),
    UserModel(id: 6, phone: '0592425660', name: 'rawan'),
    UserModel(id: 7, phone: '0592425660', name: 'rawan'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),

      ),
      body: ListView.separated(itemBuilder: (context,index)=> builduserItem(users[index]),
          separatorBuilder: (context,index)=> Padding(
            padding: const EdgeInsetsDirectional.only(start: 20.00),
            child: Container(
              width: double.infinity,
              height: 1.00,
              color: Colors.grey[300],
            ),
          ), itemCount: users.length)
      ,
    );
  }
 Widget builduserItem(UserModel user) => Padding(
   padding: const EdgeInsets.all(20.0),
   child: Row(
     children: [
       CircleAvatar(
         radius: 20.00,child:
       Text('${user.id}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
       ),
       SizedBox(width: 20,),
       Column(
         mainAxisSize: MainAxisSize.min,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text('${user.name}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),
           Text('${user.phone}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 18),),

         ],
       )

     ],
   ),
 );
}
