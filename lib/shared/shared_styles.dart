import 'package:calendar/shared/app_colors.dart';
import 'package:flutter/material.dart';

// Box Decorations

BoxDecoration fieldDecortaion = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.white);

BoxDecoration disabledFieldDecortaion = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[100]);

// Field Variables

const double fieldHeight = 55;
const double smallFieldHeight = 40;
const double inputFieldBottomMargin = 30;
const double inputFieldSmallBottomMargin = 0;
const EdgeInsets fieldPadding = const EdgeInsets.symmetric(horizontal: 15);
const EdgeInsets largeFieldPadding =
    const EdgeInsets.symmetric(horizontal: 15, vertical: 15);

// Text Variables
const TextStyle buttonTitleTextStyle =
    const TextStyle(fontWeight: FontWeight.w400, color: whiteColor, fontSize: 15);

const TextStyle stepTitleTextStyle =
    const TextStyle(fontWeight: FontWeight.w700, color: textColor, fontSize: 15);
const TextStyle stepSubTitleTextStyle = const TextStyle(fontWeight: FontWeight.w400, color: textColor, fontSize: 12);

// Box Shadow
const BoxShadow mainShadowBox = BoxShadow(blurRadius: 16, color: shadowColor, offset: Offset(0, 5));
const BoxShadow cardShadowBox = BoxShadow(blurRadius: 23, color: cardShadowColor, offset: Offset(0, 2));