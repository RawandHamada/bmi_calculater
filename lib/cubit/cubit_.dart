import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class NewsCubit extends Cubit<NewsAppStats>
{
  NewsCubit() : super(NewsInitialStates());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex =0 ;
  List<BottomNavigationBarItem> bottomNavigationBarItem=
  [
    BottomNavigationBarItem(
      icon:Icon(
        Icons.business_center),
      label:'business' ,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_baseball),
      label: 'sport',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'science',
    ),

  ];
 /* List <Widget> Screens=
  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),

  ];*/
  List<dynamic> business=[];
  List<dynamic> sports =[];
  List<dynamic> science =[];
  List<dynamic> search =[];
  ThemeMode appTheme = ThemeMode.dark ;

void onTabNavigationBar(int index)
{

  currentIndex= index;
  if(currentIndex==1)
  {
  //  getSportsData();
  }else if(currentIndex==2)
  {
   // getScienceData();
  }else if(currentIndex==0){
  //  getBusinessData();
  }
  emit(OnTabNavigationBarStates());
}





}