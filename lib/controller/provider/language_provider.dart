import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier{
  bool isEn=true;
  List <Map<String,String>> textAr=[
  {'drawer_title':'عالم الطبخ'}
  ];
  List <Map<String,String>>textEn=[
  { 'drawer_title':'Cooking Up!'}
  ];
  changeLan(bool lan){
    isEn=lan;
    notifyListeners();
  }
   getText(String ListText){
    if(isEn==true) return textEn;
    else return textAr;
  }
}