import 'package:flutter/material.dart';
import 'package:menu_app_2_2/controller/provider/language_provider.dart';
import 'package:menu_app_2_2/controller/provider/meal_provider.dart';
import 'package:menu_app_2_2/generated/l10n.dart';
import 'package:menu_app_2_2/view/widget/meal_item.dart';
import 'package:provider/provider.dart';
import '../../controller/provider/meal_provider.dart';
import '../../model/meal.dart';
import '../../utils/responsiv.dart';

class FavoriteScreen  extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

@override
  void initState() {
  Provider.of<MealProvider>(context,listen: false).getData();
  // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var dw=Responsive.getScreenWidth(context);
   final List <Meal>favoriteMeals=Provider.of<MealProvider>(context,listen: true).favoriteMeals;
    if(favoriteMeals.isEmpty){
      return  Center(
        child: FittedBox(child:
        Text(
          S.current.YouHaveNoFavoritesyetStartAddingSome
        )),
      );}
    else{
      return GridView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            image: favoriteMeals[index].imageUrl,
            title: favoriteMeals[index].title,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
          );
        },
        itemCount: favoriteMeals.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:dw<=400?400:500,
          childAspectRatio: Responsive.getScreenLandScape(context)?dw/(dw*0.8):dw/(dw*0.75),
          crossAxisSpacing: 0,
          mainAxisSpacing:0,
        ),
      );

    }
  }
}
