import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:menu_app_2_2/controller/provider/language_provider.dart';
import 'package:menu_app_2_2/controller/provider/meal_provider.dart';
import 'package:menu_app_2_2/view/Screen/category_meal_screen.dart';
import 'package:menu_app_2_2/view/Screen/filter_screen.dart';
import 'package:menu_app_2_2/view/Screen/meal_detelies_screen.dart';
import 'package:menu_app_2_2/view/Screen/onboarding_screen.dart';
import 'package:menu_app_2_2/view/Screen/tab_bar_screen.dart';
import 'package:menu_app_2_2/view/Screen/theme_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/provider/theme_provider.dart';
import 'generated/l10n.dart';
import 'l10n/l10n.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Widget homeScreen=(prefs.getBool('watched')??false)?OnBoardingScreen():TabsScreen();
  runApp(
      MultiProvider(
        providers: [
         ChangeNotifierProvider<MealProvider>(create: (ctx) => MealProvider(),),
          ChangeNotifierProvider<ThemeProvider>(create: (ctx) => ThemeProvider(),),
          ChangeNotifierProvider<LanguageProvider>(create:(ctx)=>LanguageProvider() ),
         ],
        child: MyApp(homeScreen),
      ),);
}

class MyApp extends StatelessWidget {
  final Widget homeScreen;

   MyApp( this.homeScreen);
  @override
  Widget build(BuildContext context) {
    var primaryColor=Provider.of<ThemeProvider>(context).primaryColor;
    var accentColor=Provider.of<ThemeProvider>(context).accentColor;
    var tm=Provider.of<ThemeProvider>(context).tm;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: tm,
      theme: ThemeData(
        primarySwatch: primaryColor,
        accentColor: accentColor,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        buttonColor: Colors.black87,
        cardColor: Colors.white,
        shadowColor: Colors.white60,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color:Color.fromRGBO(20,50,50,1),
            ),
            headline6:const TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      darkTheme: ThemeData(
        unselectedWidgetColor: Colors.white70,
      primarySwatch: primaryColor,
      accentColor: accentColor,
      canvasColor: Color.fromRGBO(14, 22, 3, 1),
      buttonColor: Colors.white70,
      cardColor: Color.fromRGBO(35,34,39,1),
      shadowColor: Colors.white60,
      fontFamily: 'Raleway',
      textTheme: ThemeData.dark().textTheme.copyWith(
          bodyText1: const TextStyle(
            color: Colors.white70,
          ),
          headline6:const TextStyle(
            color: Colors.white70,
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          )),
    ),
      initialRoute: '/1',
      supportedLocales: L10n.supportedLocales,
      localizationsDelegates:  [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      ],
      routes: {
        '/1': (context) => homeScreen,
        TabsScreen.routName:(context)=>TabsScreen(),
        CategoryMealScreen.routName: (context) => CategoryMealScreen(),
        MealDetelesScreen.routName: (context) => MealDetelesScreen(),
        FilterScreen.routName: (context) => FilterScreen(),
        ThemeScreen.routName:(context)=>ThemeScreen()
      },
    );
  }
}
