import 'package:calendar/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:calendar/shared/shared_styles.dart';
import 'package:calendar/shared/ui_helpers.dart';

import 'note_text.dart';

class DateField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool isReadOnly;
  final String placeholder;
  final String validationMessage;
  final bool smallVersion;
  final FocusNode fieldFocusNode;
  final FocusNode nextFocusNode;
  final TextInputAction textInputAction;
  final String additionalNote;
  final Function(DateTime) onChanged;
  final TextInputFormatter formatter;
  final DateTime value;

  DateField(
      {this.controller,
      @required this.placeholder,
      this.fieldFocusNode,
      this.nextFocusNode,
      this.additionalNote,
      this.onChanged,
      this.formatter,
      this.value,
      this.validationMessage,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.isReadOnly = false,
      this.smallVersion = false});

  @override
  _DateFieldState createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
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
          padding: fieldPadding,
          decoration:
              widget.isReadOnly ? disabledFieldDecortaion : fieldDecortaion,
          child: GestureDetector(
            onTap: () => {
              if (!widget.isReadOnly)
                {
                  showDatePicker(
                          context: context,
                          initialDate: widget.value == null
                              ? DateTime.now()
                              : widget.value,
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2021))
                      .then((date) {
                    widget.onChanged(date);
                  })
                }
            },
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    widget.value != null
                        ? widget.value.toString()
                        : widget.placeholder,
                    style: TextStyle(
                        fontSize: widget.smallVersion ? 12 : 15,
                        color: widget.value != null
                            ? textColor
                            : textColorLight),
                  ),
                ),
                Container(
                    width: fieldHeight,
                    height: fieldHeight,
                    alignment: Alignment.center,
                    child: Icon(Icons.calendar_today, color: textColor)),
              ],
            ),
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
