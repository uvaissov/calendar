import 'package:calendar/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:calendar/shared/shared_styles.dart';
import 'package:calendar/shared/ui_helpers.dart';

import 'note_text.dart';

class CheckBoxField extends StatefulWidget {
  final bool isReadOnly;
  final String placeholder;
  final String validationMessage;
  final bool smallVersion;
  final FocusNode fieldFocusNode;
  final FocusNode nextFocusNode;
  final String additionalNote;
  final Function(bool) onChanged;
  final bool initialValue;

  CheckBoxField(
      {
      @required this.placeholder,
      this.fieldFocusNode,
      this.nextFocusNode,
      this.additionalNote,
      this.onChanged,
      this.initialValue,
      this.validationMessage,
      this.isReadOnly = false,
      this.smallVersion = false});

  @override
  _CheckBoxFieldState createState() => _CheckBoxFieldState();
}

class _CheckBoxFieldState extends State<CheckBoxField> {
  double fieldHeight = 55;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(          
          height: widget.smallVersion ? 40 : fieldHeight,          
          alignment: Alignment.centerLeft,
          padding: widget.smallVersion ? EdgeInsets.symmetric(horizontal: 5): fieldPadding,
          decoration:
              widget.isReadOnly ? disabledFieldDecortaion : fieldDecortaion,
          child: Row(
            children: <Widget>[
              Checkbox(value: widget.initialValue, onChanged: widget.onChanged, activeColor: greenColor,),
              Expanded(
                child: Text(widget.placeholder,
                  style: TextStyle( color: textColor ),
                ),
              ),
            ],
          ),
        ),
        if (widget.validationMessage != null)
          NoteText(
            widget.validationMessage,
            color: Colors.red,
          ),
        if (widget.additionalNote != null) verticalSpace(5),
        if (widget.additionalNote != null) NoteText(widget.additionalNote),
        verticalSpaceSmall
      ],
    );
  }
}
