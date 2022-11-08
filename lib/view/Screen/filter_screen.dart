import 'package:flutter/material.dart';
import 'package:menu_app_2_2/utils/responsiv.dart';
import 'package:menu_app_2_2/view/widget/drawar.dart';
import 'package:provider/provider.dart';

import '../../controller/provider/meal_provider.dart';
import '../component/component.dart';
class FilterScreen extends StatefulWidget {
 static String routName='/filter';

 final bool fromOnBoarding;
 FilterScreen({this.fromOnBoarding=false});
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    var land=Responsive.getScreenLandScape(context);
    final Map<String, bool> currentFilters=Provider.of<MealProvider>(context,).currentFilters;
    return Scaffold(
    drawer:widget.fromOnBoarding?null: drawerMain(),
    body: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: widget.fromOnBoarding?null:Text("Your Filers",),
          pinned: false,
          backgroundColor: widget.fromOnBoarding?Theme.of(context).canvasColor:Theme.of(context).primaryColor,
          elevation: widget.fromOnBoarding?0:5,
        ),
        SliverList(delegate: SliverChildListDelegate([
            SizedBox(
              height: Responsive.getScreenHeight(context)*0.03,
            ),
           SizedBox(
             height: Responsive.getScreenHeight(context)*0.06,
             child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
           ),
          SizedBox(
            height: Responsive.getScreenHeight(context)*0.09,
            child: Component.buildSwitchListTile(
              context: context,
              title: 'Gluten-free',
              description: 'Only include gluten-free meals.',
              value: currentFilters['gluten'],
              onChange:   (newValue) {
                setState(
                      () {
                    currentFilters['gluten'] = newValue;
                  },
                );
                Provider.of<MealProvider>(context,listen: false).setFilters();
              },
            ),
          ),
          if(land)SizedBox(height: Responsive.getScreenHeight(context)*0.05,),
          SizedBox(
            height: Responsive.getScreenHeight(context)*0.09,
            child: Component.buildSwitchListTile(
              context: context,
              title : 'Lactose-free',
              description: 'Only include lactose-free meals.',
              value: currentFilters['lactose'],
              onChange:   (newValue) {
                setState(
                      () {
                    currentFilters['lactose'] = newValue;
                  },
                );
                Provider.of<MealProvider>(context,listen: false).setFilters();
              },
            ),
          ),
          if(land)SizedBox(height: Responsive.getScreenHeight(context)*0.05,),
          SizedBox(
            height: Responsive.getScreenHeight(context)*0.09,
            child: Component.buildSwitchListTile(
              context: context,
              title:  'Vegetarian',
              description: 'Only include vegetarian meals.',
              value:  currentFilters['vegetarian'],
              onChange:   (newValue) {
                setState(
                      () {
                    currentFilters['vegetarian'] = newValue;
                  },
                );
                Provider.of<MealProvider>(context,listen: false).setFilters();
              },
            ),
          ),
          if(land)SizedBox(height: Responsive.getScreenHeight(context)*0.05,),
          SizedBox(
            height: Responsive.getScreenHeight(context)*0.09,
            child: Component.buildSwitchListTile(
              context: context,
              title: 'Vegan',
              description: 'Only include vegan meals.',
              value: currentFilters['vegan'],
              onChange:  (newValue) {
                setState(
                      () {
                    currentFilters['vegan'] = newValue;
                  },
                );
                Provider.of<MealProvider>(context,listen: false).setFilters();
              },
            ),
          ),



        ])),
      ]),
    );

  }
}
