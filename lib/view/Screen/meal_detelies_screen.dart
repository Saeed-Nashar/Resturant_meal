import 'package:flutter/material.dart';
import 'package:menu_app_2_2/generated/l10n.dart';
import 'package:menu_app_2_2/utils/responsiv.dart';
import 'package:menu_app_2_2/view/component/component.dart';
import 'package:provider/provider.dart';

import '../../controller/provider/meal_provider.dart';
import '../../dummy_data.dart';

class MealDetelesScreen extends StatefulWidget {
  static String routName = "MealetelesScreen";

  @override
  State<MealDetelesScreen> createState() => _MealDetelesScreenState();
}

class _MealDetelesScreenState extends State<MealDetelesScreen> {
  @override
  Widget build(BuildContext context) {
    var accentColor = Theme.of(context).accentColor;
    final routArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final mealId = routArg['id'];
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: Responsive.getScreenHeight(context) * 0.4,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(selectMeal.title),
              background: Hero(
                tag: mealId!,
                child: InteractiveViewer(
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/image/a2.png'),
                    image: NetworkImage(
                      selectMeal.imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            if (Responsive.getScreenLandScape(context))
              SizedBox(
                height: Responsive.getScreenHeight(context) * 0.02,
              ),
            if (Responsive.getScreenLandScape(context))
              Row(
                children: [
                  Column(
                    children: [
                      Component.buildTitle(context, text: "Ingredients"),
                      Component.buidContainerInfo(
                        context,
                        child: ListView.builder(
                          padding: EdgeInsets.all(0),
                          itemBuilder: (ctx, index) => Card(
                            color: accentColor,
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        Responsive.getScreenHeight(context) *
                                            0.015,
                                    horizontal:
                                        Responsive.getScreenWidth(context) *
                                            0.004),
                                child: Text(
                                  selectMeal.ingredients[index],
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                          itemCount: selectMeal.ingredients.length,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Component.buildTitle(context, text: 'Steps'),
                      Component.buidContainerInfo(
                        context,
                        child: ListView.builder(
                          padding: EdgeInsets.all(0),
                          itemBuilder: (ctx, index) => Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  child: Text(
                                    '#${index + 1}',
                                  ),
                                ),
                                title: Text(
                                  selectMeal.steps[index],
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Divider(),
                            ],
                          ),
                          itemCount: selectMeal.steps.length,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            SizedBox(
              height: Responsive.getScreenHeight(context) * 0.02,
            ),
            if (!Responsive.getScreenLandScape(context))
              Component.buildTitle(context, text: S.current.Ingredients),
            if (!Responsive.getScreenLandScape(context))
              Component.buidContainerInfo(
                context,
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemBuilder: (ctx, index) => Card(
                    color: accentColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Responsive.getScreenHeight(context) * 0.006,
                          horizontal:
                              Responsive.getScreenWidth(context) * 0.004),
                      child: Text(
                        selectMeal.ingredients[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  itemCount: selectMeal.ingredients.length,
                ),
              ),
            if (!Responsive.getScreenLandScape(context))
              Component.buildTitle(context, text: S.current.Steps),
            if (!Responsive.getScreenLandScape(context))
              Component.buidContainerInfo(
                context,
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            '#${index + 1}',
                          ),
                        ),
                        title: Text(
                          selectMeal.steps[index],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                  itemCount: selectMeal.steps.length,
                ),
              ),

          ],),),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        child: Icon(
          Provider.of<MealProvider>(context, listen: true)
                  .isMealFavorite(mealId)
              ? Icons.favorite
              : Icons.favorite_border,
        ),
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () => Provider.of<MealProvider>(context, listen: false)
            .toggleFavorite(mealId),
      ),
    );
  }
}
//for delete item
/* floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: (){
          Navigator.of(context).pop(mealId);
        },
      ),*/
