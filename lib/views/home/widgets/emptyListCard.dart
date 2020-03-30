import 'package:calendar/core/localizations.dart';
import 'package:calendar/shared/app_colors.dart';
import 'package:calendar/shared/shared_styles.dart';
import 'package:calendar/widgets/CardContainer.dart';
import 'package:flutter/material.dart';

class EmptyListCard extends StatelessWidget {

  const EmptyListCard();

  @override
  Widget build(BuildContext context) {
    return CardContainer(    
      shadow: cardShadowBox,          
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 15
                ),
                child:  Column( children: <Widget>[
                  Text(AppLocalizations.of(context).translate('main.emptyList.title') , style: TextStyle(fontSize: 25, color: textColor),),
                  Text(AppLocalizations.of(context).translate('main.emptyList.firstPaymentNotAdded') , style: TextStyle(fontSize: 13, color: textColorLight),),
                ],)
              ),
            );
  }
}
