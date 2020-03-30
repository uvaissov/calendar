import 'package:calendar/shared/app_colors.dart';
import 'package:calendar/shared/shared_styles.dart';
import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  final BoxShadow shadow;
  const CardContainer({this.child, this.shadow});

  @override
  Widget build(BuildContext context) {
    return Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [shadow ?? BoxShadow(color: Colors.transparent)]
                ),
                child: child,
              );
  }
}
