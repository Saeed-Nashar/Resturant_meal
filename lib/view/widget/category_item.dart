import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_app_2_2/utils/responsiv.dart';
import 'package:menu_app_2_2/view/Screen/category_meal_screen.dart';
class CategoryItem extends StatelessWidget {
final String id;
final String title;
final Color color;


 CategoryItem(  this.id, this.title,  this.color,);
  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routName,
arguments: {
      'id':id,
        'title':title
   }
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(Responsive.getScreenHeight(context)*0.02),
      child: Container(
      padding: EdgeInsets.all(Responsive.getScreenHeight(context)*0.02),
      child: Text(
        title,
      style: Theme.of(context).textTheme.titleLarge,
      ),
       decoration: BoxDecoration(
         color: color,
         borderRadius: BorderRadius.circular(Responsive.getScreenHeight(context)*0.02),

         ),
        ),
    );
  }
}
