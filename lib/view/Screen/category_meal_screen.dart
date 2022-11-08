import 'package:flutter/material.dart';
import 'package:menu_app_2_2/dummy_data.dart';
import 'package:menu_app_2_2/model/meal.dart';
import 'package:menu_app_2_2/view/widget/meal_item.dart';
import 'package:provider/provider.dart';

import '../../controller/provider/meal_provider.dart';
import '../../utils/responsiv.dart';

class CategoryMealScreen extends StatefulWidget {

  static String routName = 'categoryMealScreen';



  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
   String ?categoryTitle;
  late List <Meal>?displayedMeals;
@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
  final List<Meal> availableMeals =Provider.of<MealProvider>(context,listen: true).availableMeals;
  final routArg =
  ModalRoute.of(context)?.settings.arguments as Map<String, String>;
  final categoryId = routArg['id'];
  categoryTitle = routArg['title'];
  displayedMeals = availableMeals.where((meal) {
    return meal.categories.contains(categoryId);
  }).toList();
    super.didChangeDependencies();
  }


  void removeItem(String mealId){
    setState(() {
      displayedMeals!.removeWhere((meal) => meal.id==mealId);
    });
  }
  @override
  Widget build(BuildContext context) {
  var dw= Responsive.getScreenWidth(context);
   //print(Responsive.getScreenHeight(context));
   print(dw);
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: GridView.builder(
          itemBuilder: (ctx, index) {
        return MealItem(
          id: displayedMeals![index].id,
          image: displayedMeals![index].imageUrl,
          title: displayedMeals![index].title,
          duration: displayedMeals![index].duration,
          complexity: displayedMeals![index].complexity,
          affordability: displayedMeals![index].affordability,
        //  removeItem: removeItem, for remove item
        );
      },
        itemCount: displayedMeals!.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:dw<=400?400:500,
          childAspectRatio: Responsive.getScreenLandScape(context)?dw/(dw*0.8):dw/(dw*0.75),
          crossAxisSpacing: 0,
          mainAxisSpacing:0,
        ),
      ),
    );
  }
}
