import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MessengerScreen extends StatefulWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  _MessengerScreenState createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 20.00,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 20.00,
              backgroundImage: NetworkImage('https://scontent.fgza2-1.fna.fbcdn.net/v/t1.6435-9/36688211_1059694777513655_8966787181603454976_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=QpzswR75ArwAX9oWD4p&tn=ROgFHP3_sUUIuxYD&_nc_ht=scontent.fgza2-1.fna&oh=d6af59431c2f088a0e80ff4531b8e025&oe=61D26BA0'),
            ),
            SizedBox(width: 10.00,),
            Text('Chats',style: TextStyle(color: Colors.black),),
          ]

          ,),
        actions: [
          IconButton(onPressed: (){}, icon: CircleAvatar(radius: 15.00,
          backgroundColor: Colors.blue,child: Icon(Icons.camera_alt),),color: Colors.white,iconSize: 16.00,),
          IconButton(onPressed: (){}, icon: CircleAvatar(radius: 15.00,
          backgroundColor: Colors.blue,child: Icon(Icons.edit),)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5.00),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.00),color: Colors.grey[300]),
                child: Row(
                  children: const [
                    Icon(Icons.search),
                    SizedBox(width: 15.00,),
                    Text('Search'),
                  ],
                ),
              ),
              SizedBox(height: 20.00,),
              Container(
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index)=> buildStoryItem(),
                  separatorBuilder: (context,index)=> SizedBox(width: 20.00,),
                itemCount: 5,

                ),
              ),
              SizedBox(height: 40.00,),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemBuilder: (context,index)=> buildChatItem(),
                  separatorBuilder: (context,index)=>SizedBox(height: 20.00,), itemCount: 15)

            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatItem() => Row(
         children: [
       Stack(
         alignment: AlignmentDirectional.bottomEnd,
         children: const [
           CircleAvatar(
             radius: 30.00,
             backgroundImage: NetworkImage('https://scontent.fgza2-1.fna.fbcdn.net/v/t1.6435-9/36688211_1059694777513655_8966787181603454976_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=QpzswR75ArwAX9oWD4p&tn=ROgFHP3_sUUIuxYD&_nc_ht=scontent.fgza2-1.fna&oh=d6af59431c2f088a0e80ff4531b8e025&oe=61D26BA0'),
           ),

           Padding(
             padding: EdgeInsetsDirectional.only(
                 bottom: 3.00,
                 end: 3.00
             ),
             child: CircleAvatar(
               radius: 7.00,
               backgroundColor: Colors.red,
             ),
           ),
         ],
       ),
       SizedBox(width: 20.00,) ,
       Expanded(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text('Rawand Hamada',maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16.00,fontWeight: FontWeight.bold)),
             Row(
               children: [
                 Expanded(child: Text('Rawand Hamada holle',)),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                   child: Container(width: 5.00,height: 5.00,
                     decoration: BoxDecoration(color: Colors.blue,shape: BoxShape.circle),),
                 ),
                 Text('2.00 am'),
               ],
             )
           ],
         ),
       )
     ],
   );

  Widget buildStoryItem()=> Container(
          width:60.00 ,
         child: Column(
             children: [
              Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                 children: const [
                 CircleAvatar(
                  radius: 30.00,
                  backgroundImage: NetworkImage('https://scontent.fgza2-1.fna.fbcdn.net/v/t1.6435-9/36688211_1059694777513655_8966787181603454976_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=QpzswR75ArwAX9oWD4p&tn=ROgFHP3_sUUIuxYD&_nc_ht=scontent.fgza2-1.fna&oh=d6af59431c2f088a0e80ff4531b8e025&oe=61D26BA0'),
                 ),

                  Padding(
                   padding: EdgeInsetsDirectional.only(
                  bottom: 3.00,
                  end: 3.00
                      ),
                   child: CircleAvatar(
                    radius: 7.00,
                   backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
            SizedBox(height: 6.00,),
             Text('Rawand Hamada',maxLines: 2,overflow: TextOverflow.ellipsis,),
      ],
    ),
  );
}
