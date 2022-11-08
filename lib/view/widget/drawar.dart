import 'package:flutter/material.dart';
import 'package:menu_app_2_2/controller/provider/language_provider.dart';
import 'package:menu_app_2_2/controller/provider/theme_provider.dart';
import 'package:menu_app_2_2/generated/l10n.dart';
import 'package:menu_app_2_2/utils/responsiv.dart';

import 'package:menu_app_2_2/view/Screen/theme_screen.dart';
import 'package:provider/provider.dart';

import '../Screen/filter_screen.dart';
import '../component/component.dart';

class drawerMain extends StatefulWidget {
  @override
  State<drawerMain> createState() => _drawerMainState();
}

class _drawerMainState extends State<drawerMain> {
  @override
  Widget build(BuildContext context) {
    var lan= Provider.of<LanguageProvider>(context,listen: true);
    return Directionality(
      textDirection: lan.isEn?TextDirection.ltr:TextDirection.rtl,
      child: Drawer(
        elevation: 0,
        child: Column(
          children: [
            Container(
              height: Responsive.getScreenWidth(context) * 0.3,
              width: double.infinity,
              padding: EdgeInsets.all(Responsive.getScreenHeight(context) * 0.01),
              alignment:lan.isEn? Alignment.centerLeft:Alignment.centerRight,
              color: Theme.of(context).accentColor,
              child: Text(
                S.current.setting,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color:  Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: Responsive.getScreenHeight(context) * 0.01,
            ),
            SizedBox(
              height:Responsive.getScreenHeight(context) * 0.06,
              child: Component.buildListTile(
                context: context,
                data: S.current.Meals,
                icon: Icons.restaurant,
                function: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
                fontFamily: 'RobotoCondensed',
              ),
            ),
            SizedBox(
              height: Responsive.getScreenHeight(context) * 0.06,
              child: Component.buildListTile(
                  context: context,
                  data: S.current.Filter,
                  icon: Icons.settings,
                  function: () {
                    Navigator.of(context)
                        .pushReplacementNamed(FilterScreen.routName);
                  },
                  fontFamily: 'RobotoCondensed'),
            ),
            SizedBox(
              height:Responsive.getScreenHeight(context) * 0.06,
              child: Component.buildListTile(
                  context: context,
                  data: S.current.theme,
                  icon: Icons.color_lens,
                  function: (){
                    Navigator.of(context)
                        .pushReplacementNamed(ThemeScreen.routName);
                  },
                  fontFamily: 'RobotoCondensed'),
            ),
          /*  Divider(
              height: Responsive.getScreenHeight(context) * 0.05,
              color: Colors.black54,
              thickness: 1,
            ),*/
          /*  Container(
              alignment: Alignment.center,
              height: Responsive.getScreenHeight(context) * 0.04,
              child:Component.buildTitle(context, text: S.current.choseYourPreferredLanguage),
            ),*/
         /* SizedBox(
            height: Responsive.getScreenHeight(context) * 0.06,
            child: Padding(
              padding: EdgeInsets.only(
                right: (lan.isEn?0:20),left: (lan.isEn?20:0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 Text(S.current.Arabic,style: Theme.of(context).textTheme.headline6,),
                  Switch(value:lan.isEn ,
                      onChanged: (newVal){
                    Provider.of<LanguageProvider>(context,listen: false).changeLan(newVal);
                    Navigator.of(context).pop();
                  },
                  inactiveTrackColor:Provider.of<ThemeProvider>(context).tm==ThemeMode.light?null: Colors.black,
                  ),
                  Text(S.current.English,style: Theme.of(context).textTheme.headline6,),
                ],
              ),
            ),
          ),
            Divider(
              height: Responsive.getScreenHeight(context) * 0.05,
              color: Colors.black54,
              thickness: 1,
            ),*/
          ],
        ),
      ),
    );
  }
}
