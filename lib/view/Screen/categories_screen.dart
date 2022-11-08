import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_app_2_2/controller/provider/meal_provider.dart';
import 'package:menu_app_2_2/dummy_data.dart';
import 'package:menu_app_2_2/utils/responsiv.dart';
import 'package:provider/provider.dart';

import '../widget/category_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
          padding: EdgeInsets.all(Responsive.getScreenWidth(context) * 0.05),
          children: Provider.of<MealProvider>(context).availableCategory
              .map((categoryData)=>
              CategoryItem(
            categoryData.id,
            categoryData.title,
            categoryData.color,

          )).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: Responsive.getScreenWidth(context) * 0.42,
      childAspectRatio:Responsive.getScreenLandScape(context)?3.2: 1.5,
      crossAxisSpacing: Responsive.getScreenWidth(context) * 0.03,
      mainAxisSpacing: Responsive.getScreenHeight(context) * 0.02,
    ),)
    ,
    );
  }
}

//co
