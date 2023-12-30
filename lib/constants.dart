import 'package:flutter/material.dart';
import 'package:todoey/common/themes/app_color_scheme.dart';
import 'package:todoey/common/themes/app_text_theme.dart';

final kListIcon = CircleAvatar(
  child: Icon(
    Icons.list,
    size: 30.0,
    color: TaskGenieColor.colorPalette6,
  ),
  backgroundColor: Colors.white,
  radius: 30.0,
);

final kHeadText = Text(
  'TaskGenie',
  style: TaskGenieTextTheme.taskGenieTextTheme(Colors.white).titleLarge,
);

final kCardDecoration = BoxDecoration(
  color: TaskGenieColor.colorPalette3,
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),
  ),
);

const kAddCardDecoration = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),
  ),
);

promptSnackBar({required BuildContext context,required String prompt}){
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(prompt,style: TaskGenieTextTheme.taskGenieTextTheme(Colors.white).labelSmall,),
      backgroundColor: TaskGenieColor.colorPalette4,
      duration: const Duration(milliseconds: 1000),
    ),
  );
}