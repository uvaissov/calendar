import 'package:calendar/shared/app_colors.dart';
import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  const CardContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: child,
              );
  }
}
