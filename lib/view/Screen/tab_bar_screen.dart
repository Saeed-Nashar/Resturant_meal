import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:menu_app_2_2/controller/provider/meal_provider.dart';
import 'package:menu_app_2_2/controller/provider/theme_provider.dart';
import 'package:menu_app_2_2/generated/l10n.dart';

import 'package:menu_app_2_2/view/Screen/categories_screen.dart';
import 'package:menu_app_2_2/view/Screen/favorite_screen.dart';
import 'package:menu_app_2_2/view/widget/drawar.dart';
import 'package:provider/provider.dart';



class TabsScreen extends StatefulWidget {

static String routName='/';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late final List<Map<String, Widget>> pages;
  late final List<Map<String, String>> title;
  int selectedIndex = 0;

  final iconList = <IconData>[
    Icons.widgets,
    Icons.favorite,
  ];

  @override
  void initState() {
    Provider.of<MealProvider>(context,listen: false).getData();
    Provider.of<ThemeProvider>(context,listen: false).getThemeMode();
    Provider.of<ThemeProvider>(context,listen:false).getThemeChooseColor();
    pages = [
      {
        'page': CategoryScreen(),
      },
      {
        'page': FavoriteScreen(),

      },

    ];
    title = [
      {
        'title': S.current.Categories

        ,
      },
       {
         'title': S.current.favorite,
       }
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title),
      body: pages[selectedIndex]['page'],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        backgroundColor: Provider.of<ThemeProvider>(context,listen: true).primaryColor,
        activeIndex: selectedIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        activeColor: Colors.white,
        inactiveColor: Colors.white30,
        onTap: (index) => setState(() => selectedIndex = index),
      ),
      // drawer: drawerMain(),

      drawer: drawerMain()
    );
  }

  AppBar buildAppBar(title) {
    return AppBar(

      title: Text(title[selectedIndex]['title']),
    );
  }
}
