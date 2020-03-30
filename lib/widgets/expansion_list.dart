import 'package:calendar/shared/app_colors.dart';
import 'package:calendar/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:calendar/shared/shared_styles.dart' as sharedStyles;

import 'note_text.dart';

class ExpansionList<T> extends StatefulWidget {
  final List<T> items;
  final String title;
  final String placeholder;
  final String additionalNote;
  final Function(dynamic) onItemSelected;
  final bool smallVersion;
  ExpansionList({
    Key key,
    this.items,
    this.title,
    @required this.onItemSelected,
    this.smallVersion = false,
    this.placeholder,
    this.additionalNote
  }) : super(key: key);

  _ExpansionListState createState() => _ExpansionListState();
}

class _ExpansionListState extends State<ExpansionList> {
  final double startingHeight = sharedStyles.fieldHeight;
  double expandedHeight;
  bool expanded = false;
  String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.title;
    _calculateExpandedHeight();
  }

  @override
  Widget build(BuildContext context) {
    return Column( 
      crossAxisAlignment: CrossAxisAlignment.start,    
      children: <Widget>[
        AnimatedContainer(
          padding: sharedStyles.fieldPadding,
          duration: const Duration(milliseconds: 180),
          height: expanded
              ? expandedHeight
              : widget.smallVersion
                  ? sharedStyles.smallFieldHeight
                  : startingHeight,
          decoration: sharedStyles.fieldDecortaion.copyWith(
            boxShadow: expanded
                ? [sharedStyles.cardShadowBox]
                : null,
          ),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            children: <Widget>[
              ExpansionListItem(
                title: selectedValue,
                placeholder: widget.placeholder,
                onTap: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
                showArrow: true,
                smallVersion: widget.smallVersion,
              ),
              Container(
                height: 2,
                color: Colors.grey[300],
              ),
              ..._getDropdownListItems(),                   
            ],
          ),
        ),
        if (widget.additionalNote != null) verticalSpace(5),
        if (widget.additionalNote != null) NoteText(widget.additionalNote),  
      ],
    );
  }

  List<Widget> _getDropdownListItems() {
    return widget.items
        .map((item) => ExpansionListItem(
            smallVersion: widget.smallVersion,
            title: item.name,
            onTap: () {
              setState(() {
                expanded = !expanded;
                selectedValue = item.name;
              });

              widget.onItemSelected(item);
            }))
        .toList();
  }

  void _calculateExpandedHeight() {
    expandedHeight = 2 +
        (widget.smallVersion
            ? sharedStyles.smallFieldHeight
            : sharedStyles.fieldHeight) +
        (widget.items.length *
            (widget.smallVersion
                ? sharedStyles.smallFieldHeight
                : sharedStyles.fieldHeight));
  }
}

class ListItem {
  final String code;
  final String name;

  ListItem({this.code, this.name});
}

class ExpansionListItem extends StatelessWidget {
  final Function onTap;
  final String title;
  final String placeholder;
  final bool showArrow;
  final bool smallVersion;
  const ExpansionListItem({
    Key key,
    this.onTap,
    this.title,
    this.placeholder,
    this.showArrow = false,
    this.smallVersion = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: smallVersion
            ? sharedStyles.smallFieldHeight
            : sharedStyles.fieldHeight,
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(
                title ?? placeholder ?? '',
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .copyWith(fontSize: smallVersion ? 12 : 15, color: title==null ? textColorLight : textColor ),
              ),
            ),
            showArrow
                ? Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey[700],
                    size: 20,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
