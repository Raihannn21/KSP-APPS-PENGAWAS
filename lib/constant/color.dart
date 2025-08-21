import 'package:flutter/material.dart';

const Color primaryColor = green2Color;
const Color secondColor = Color(0xff6897B9);
const Color blackColor = Color(0xff1B2125);
const Color whiteColor = Color(0xffFFFFFF);
const Color lightBlue1Color = Color(0xffDFF2FF);
const Color lightBlue2Color = Color(0xffAEDDFF);
const Color blue1Color = Color(0xff97C5E9);
const Color blue2Color = Color(0xff7FADD1);
const Color darkBlue1Color = Color(0xff7397B4);
const Color darkBlue2Color = Color(0xff455868);
Color backgroundColor = Colors.grey.shade50;
const Color greyColor = Colors.grey;
const Color lightGreyColor = Color(0xffF9F9F9);
const Color lightGreen1Color = Color(0xffEAFDF7);
const Color lightGreen2Color = Color(0xff58E4BA);
const Color lightGreen3Color = Color(0xffD0F8E7);
const Color lightGreen4Color = Color(0xff48CDA5);
const Color green1Color = Color(0xff46C8A2);
const Color green2Color = Color(0xff38B58F);
const Color green3Color = Color(0xff387965);
const Color green4Color = Color(0xff58E4BA);
const Color accentColor = Color(0xffF3E6A2);
const Color pinkColor = Color(0xffF49595);
const Color greenBrightColor = Color(0xff84F1A2);
const Color strokeGreyColor = Color(0x4c717271);

List randomColors = [
  Colors.orange[200],
  Colors.blue[200],
  Colors.red[200],
  Colors.pink[200],
  Colors.purple[200],
  Colors.blueGrey[400]
];

Color? getRandomColor() {
  return (randomColors..shuffle()).first;
}
