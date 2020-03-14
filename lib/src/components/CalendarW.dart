import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';

class CalendarW extends StatefulWidget {
  CalendarW({Key key}) : super(key: key);
  @override
  _CalendarWState createState() => _CalendarWState();
}

class _CalendarWState extends State<CalendarW> { 
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarController: _calendarController,
    );
  }
}