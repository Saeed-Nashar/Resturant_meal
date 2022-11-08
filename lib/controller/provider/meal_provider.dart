import 'package:flutter/material.dart';
import 'package:menu_app_2_2/model/category.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../dummy_data.dart';
import '../../model/meal.dart';


class MealProvider with ChangeNotifier {
  Map<String, bool> currentFilters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> availableMeals = DUMMY_MEALS;
  List <Meal> favoriteMeals = [];
  List<String>prefMealId=[];
  List<Category>availableCategory=DUMMY_CATEGORIES;

  void setFilters()async {
    availableMeals = DUMMY_MEALS.where((meal) {
      if (currentFilters['gluten']! && !meal.isGlutenFree) {
        return false;
      }
      if (currentFilters['lactose']! && !meal.isLactoseFree) {
        return false;
      }
      if (currentFilters['vegan']! && !meal.isVegan) {
        return false;
      }
      if (currentFilters['vegetarian']! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    List <Category>ac=[];
    availableMeals.forEach((meal) {
      meal.categories.forEach((catId) {
        DUMMY_CATEGORIES.forEach((cat) {
          if(cat.id==catId){
           if(!ac.any((cat) => cat.id==catId)) ac.add(cat);
          }
        });
      });
    });
    availableCategory=ac;

  notifyListeners();
  SharedPreferences perfs= await SharedPreferences.getInstance();
    perfs.setBool('gluten', currentFilters['gluten']!);
    perfs.setBool('lactose', currentFilters['lactose']!);
    perfs.setBool('vegan', currentFilters['vegan']!);
    perfs.setBool('vegetarian', currentFilters['vegetarian']!);

  }


  void getData()async{
    SharedPreferences perfs= await SharedPreferences.getInstance();
    currentFilters['gluten']=perfs.getBool('gluten')??false;
    currentFilters['lactose']=perfs.getBool('lactose')??false;
    currentFilters['vegan']=perfs.getBool('vegan')??false;
    currentFilters['vegetarian']=perfs.getBool('vegetarian')??false;
     prefMealId=perfs.getStringList('prefMealId')??[];
    for(var mealId in prefMealId){

      final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
      if(existingIndex<0){
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      }
    }
    List <Meal> fm=[];
    favoriteMeals.forEach((favMeal) {
      availableMeals.forEach((avMeal) {
        if(favMeal.id==avMeal.id) fm.add(favMeal);
      });
    });
    favoriteMeals=fm;

  notifyListeners();
  }

  void toggleFavorite(String mealId) async{
    SharedPreferences perfs= await SharedPreferences.getInstance();
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      favoriteMeals.removeAt(existingIndex);
      prefMealId.remove(mealId);
    } else {
      favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
        prefMealId.add(mealId);
    }
    notifyListeners();
    perfs.setStringList("prefMealId",prefMealId);
  }
  bool isMealFavorite(String id) {
    return favoriteMeals.any((meal) => meal.id == id);
  }
}