import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_app_2_2/generated/l10n.dart';
import 'package:menu_app_2_2/utils/responsiv.dart';
import 'package:menu_app_2_2/view/Screen/meal_detelies_screen.dart';

import '../../model/meal.dart';

class MealItem extends StatelessWidget {
  final String image;
  final String id;
  final String title;
  final int duration;
  final Complexity complexity;
  final String affordability;
 // final Function removeItem; for remove item

  MealItem(
      {required this.id,
        required this.image,
      required this.title,
      required this.duration,
      required this.complexity,
      required this.affordability,
     //   required this.removeItem,
      });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:return  S.current.Simple; break;
      case Complexity.Hard:return  S.current.Hard; break;
      case Complexity.Challenging:return  S.current.Challenging; break;
      default: return "Unkown"; break;
    }
  }
  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetelesScreen.routName,
    arguments: {
      'id':id,
    }).then((result) {
     // if(result!=null) removeItem(result); function for remove
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: ListView(
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [
           SizedBox(
             height: Responsive.getScreenHeight(context)*0.35,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Hero(
                    tag: id,
                    child: InteractiveViewer(
                      child: FadeInImage(
                        placeholder: const AssetImage('assets/image/a2.png'),
                        image: NetworkImage(
                          image,
                        ),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height:Responsive.getScreenLandScape(context)?
                        Responsive.getScreenHeight(context) *0.5: Responsive.getScreenHeight(context) *0.4
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: Responsive.getScreenHeight(context) * 0.05,
                    right: Responsive.getScreenHeight(context) * 0.02,
                    child: Container(
                        width: Responsive.getScreenWidth(context) * 0.5,
                        padding: EdgeInsets.symmetric(
                            vertical:
                                Responsive.getScreenHeight(context) * 0.01,
                            horizontal:
                                Responsive.getScreenWidth(context) * 0.05),
                        color: Colors.black54,
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  20),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ))),
              ],
            ),),
          SizedBox(
            height: Responsive.getScreenHeight(context)*0.1,
           child: Padding(
              padding: EdgeInsets.all( Responsive.getScreenHeight(context) * 0.02,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule,color: Theme.of(context).buttonColor,),
                      SizedBox(
                        width: Responsive.getScreenWidth(context) * 0.01,
                      ),
                      Text("$duration ${S.current.minutes}"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work,color: Theme.of(context).buttonColor,),
                      SizedBox(
                        width: Responsive.getScreenWidth(context) * 0.01,
                      ),
                      Text("$complexityText"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money,color: Theme.of(context).buttonColor,),
                      SizedBox(
                        width: Responsive.getScreenWidth(context) * 0.01,
                      ),
                      Text(affordability),
                    ],
                  ),

                ],
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
