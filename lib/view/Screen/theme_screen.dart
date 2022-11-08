import 'package:flutter/material.dart';
import 'package:menu_app_2_2/utils/responsiv.dart';
import 'package:menu_app_2_2/view/widget/drawar.dart';
import '../component/component.dart';
class ThemeScreen extends StatelessWidget {
  final bool fromOnBoarding;
  ThemeScreen({this.fromOnBoarding=false});
  static String routName='/Theme';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:fromOnBoarding?null: drawerMain(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: fromOnBoarding?null: const Text("Your Themes"),
            pinned: false,
            backgroundColor: fromOnBoarding?Theme.of(context).canvasColor:Theme.of(context).primaryColor,
            elevation: fromOnBoarding?0:5,
          ),
          SliverList(delegate: SliverChildListDelegate([
            SizedBox(
              height: Responsive.getScreenHeight(context)*0.02,
            ),
            SizedBox(
                height: Responsive.getScreenHeight(context)*0.06,
                child: Component.buildTitle(context, text: 'Adjust your themes selection.')),
            Container(
              padding: EdgeInsets.all(Responsive.getScreenHeight(context)*0.01),
              child: Text(
                'Choose your Theme Mode',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(
              height: Responsive.getScreenHeight(context)*0.08,
              child: Component.buildRadioListTile(context: context,
                  themeMode: ThemeMode.system, text: 'System Default Theme', icon:Icons.system_security_update_sharp),
            ),
            SizedBox(
              height: Responsive.getScreenHeight(context)*0.08,
              child: Component.buildRadioListTile(context: context,
                  themeMode: ThemeMode.light, text: 'Light Theme', icon:Icons.wb_sunny_outlined),
            ),
            SizedBox(
              height: Responsive.getScreenHeight(context)*0.08,
              child: Component.buildRadioListTile(context: context,
                  themeMode: ThemeMode.dark, text: 'Dark Theme', icon:Icons.nights_stay_outlined),
            ),
            SizedBox(
                height: Responsive.getScreenHeight(context)*0.08,
                child: Component.buildListTileColor(context: context, text: 'primary')),
            SizedBox(
                height:Responsive.getScreenHeight(context)*0.08,
                child: Component.buildListTileColor(context: context, text: 'accent')),
          ]))
        ],
      ),
    );
  }
}
