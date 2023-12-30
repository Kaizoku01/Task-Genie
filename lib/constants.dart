import 'package:flutter/material.dart';

const kListIcon = CircleAvatar(
  child: Icon(
    Icons.list,
    size: 30.0,
    color: Colors.lightBlueAccent,
  ),
  backgroundColor: Colors.white,
  radius: 30.0,
);

const kHeadText = Text(
  'TaskGenie',
  style: TextStyle(
      color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.w700),
);

const kCardDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
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
      content: Text(prompt),
      backgroundColor: Colors.purple,
      duration: const Duration(milliseconds: 800),
    ),
  );
}