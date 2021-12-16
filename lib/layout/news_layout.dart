


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatefulWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  _NewsLayoutState createState() => _NewsLayoutState();
}

class _NewsLayoutState extends State<NewsLayout> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

          appBar: AppBar(

            title: Text('News App',),
            actions:
            [
              IconButton(onPressed:(){
                //  cubit.changeAppMode();
              }, icon:Icon(Icons.brightness_4_outlined) ),
              IconButton(onPressed:(){
               // NewsCubit.get(context).search= [];
                //  navigateTo(context, SearchScreen(),);

              }, icon:Icon(Icons.search_rounded) ),

            ],
          ),

        );


  }
}
