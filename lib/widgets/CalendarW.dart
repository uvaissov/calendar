import 'package:calendar/shared/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  CalendarWidget({Key key}) : super(key: key);
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> { 
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
      initialCalendarFormat: CalendarFormat.twoWeeks,
      startingDayOfWeek: StartingDayOfWeek.monday,      
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(color: textColor),
        weekendStyle: TextStyle(color: redColor),
      ),
      headerStyle: HeaderStyle(
        titleTextStyle: TextStyle(color: textColor, fontSize: 25, fontWeight: FontWeight.w600),
        centerHeaderTitle: true,
        formatButtonVisible: false,
        leftChevronIcon: Icon(Icons.chevron_left, color: textColor,size: 30,),
        rightChevronIcon: Icon(Icons.chevron_right, color: textColor,size: 30,)
      ),
      calendarStyle: CalendarStyle(
        selectedColor: blueColor,
        todayColor: blueColorLigth,        
        weekdayStyle: TextStyle(color: dayColor),
        weekendStyle: TextStyle(color: redColor),
        outsideStyle: TextStyle(color: dayColorLight),
        outsideHolidayStyle: TextStyle(color: dayColorLight),
        outsideWeekendStyle: TextStyle(color: dayColorLight),
      ),
      calendarController: _calendarController,
    );
  }
}