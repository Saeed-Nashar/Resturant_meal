import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:menu_app_2_2/controller/provider/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/responsiv.dart';

class Component {
  static Widget buildTitle(BuildContext context, {required String text}) =>
      Container(
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
      );

  static Widget buildSwitchListTile(
          {required value,
          required ValueChanged onChange,
          required String title,
          required String description,
         required BuildContext context}) =>
      SwitchListTile(
        value: value,
        onChanged: onChange,
        title: Text(title),
        subtitle: Text(description),
        inactiveTrackColor:Provider.of<ThemeProvider>(context).tm==ThemeMode.light?null: Colors.black,
      );

  static Widget buildListTile(
          {required BuildContext context,
          required String data,
          required IconData icon,
          required VoidCallback function,
          required String fontFamily}) =>
      ListTile(
        leading: Icon(
          icon,
          size: Responsive.getScreenHeight(context) * 0.032,
          color: Theme.of(context).buttonColor,
        ),
        title: Text(
          data,
          style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
              fontWeight: FontWeight.bold,
              fontSize: Responsive.getScreenHeight(context) * 0.033,
              fontFamily: fontFamily),
        ),
        onTap: function,
      );

  static Widget buidContainerInfo(BuildContext context,
          {required Widget child}) =>
      Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(
                Responsive.getScreenHeight(context) * 0.01),
          ),
          height:Responsive.getScreenLandScape(context)? Responsive.getScreenHeight(context) * 0.5:Responsive.getScreenHeight(context) * 0.25,
          width:Responsive.getScreenLandScape(context)? (Responsive.getScreenWidth(context)*0.5-30):Responsive.getScreenWidth(context),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(15),
          child: child);

  static Widget buildRadioListTile({
    required BuildContext context,
    required ThemeMode themeMode,
    // required Function onChange,
    required String text,
    required IconData icon,
  }) =>
      RadioListTile(
        value: themeMode,
        groupValue: Provider.of<ThemeProvider>(context, listen: true).tm,
        title: Text(text),
        secondary: Icon(icon,color:Provider.of<ThemeProvider>(context).tm==ThemeMode.dark?Colors.white:null ,),
        onChanged: (newThemeVal) =>
            Provider.of<ThemeProvider>(context, listen: false)
                .themeModeChange(newThemeVal),
      );

  static Widget buildListTileColor(
      {required BuildContext context, required String text}) {
    var primaryColor = Provider.of<ThemeProvider>(context).primaryColor;
    var accentColor = Provider.of<ThemeProvider>(context).accentColor;
    return ListTile(
      title: Text(
        'choose your $text color',
        style: Theme.of(context).textTheme.headline6,
      ),
      trailing: CircleAvatar(
        backgroundColor: text == 'primary' ? primaryColor : accentColor,
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return AlertDialog(
                elevation: 4,
                content: SingleChildScrollView(
                  child: ColorPicker(
                    pickerColor: text == 'primary'
                        ? primaryColor =
                            Provider.of<ThemeProvider>(context,listen: true).primaryColor
                        : Provider.of<ThemeProvider>(context,listen: true).accentColor,
                    onColorChanged: (newColor)=>Provider.of<ThemeProvider>(context,listen: false).
                    onChangedColor(newColor, text=='primary'?1:2),
                    displayThumbColor: true,
                    enableAlpha: false,
                    colorPickerWidth: Responsive.getScreenWidth(context)*0.7,
                    pickerAreaHeightPercent: Responsive.getScreenHeight(context)*0.001,
                  ),
                ),
              );
            });
      },
    );
  }
}
