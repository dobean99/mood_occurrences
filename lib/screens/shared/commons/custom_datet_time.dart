import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mood_occurrences/core/constants/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:mood_occurrences/screens/shared/commons/device_size.dart';

class CustomDateTime extends StatefulWidget {
  const CustomDateTime({super.key, required this.callback, this.mainColor});
  final Function(DateTime) callback;
  final Color? mainColor;

  @override
  State<CustomDateTime> createState() => _CustomDateTimeState();
}

class _CustomDateTimeState extends State<CustomDateTime> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceSize.width(context, partNumber: 10),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('MMMM yyyy').format(dateTime),
                style: TextStyle(
                    color: widget.mainColor ?? AppColors.redColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: widget.mainColor ?? AppColors.redColor,
                      onPressed: () {
                        setState(() {
                          dateTime =
                              DateTime(dateTime.year, dateTime.month - 1);
                        });
                      }),
                  IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      color: widget.mainColor ?? AppColors.redColor,
                      onPressed: () {
                        setState(() {
                          dateTime =
                              DateTime(dateTime.year, dateTime.month + 1);
                        });
                      })
                ],
              )
            ],
          ),
          TableCalendar(
            focusedDay: dateTime,
            firstDay: DateTime(2018),
            lastDay: DateTime(2100),
            currentDay: dateTime,
            headerVisible: false,
            daysOfWeekHeight: 32,
            daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: const TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 18,
                ),
                weekendStyle: TextStyle(
                  color: widget.mainColor ?? AppColors.redColor,
                  fontSize: 18,
                )),
            calendarStyle: const CalendarStyle(
                defaultTextStyle: TextStyle(
                    color: AppColors.whiteColor, fontWeight: FontWeight.w600),
                weekendTextStyle: TextStyle(
                    color: AppColors.whiteColor, fontWeight: FontWeight.w600)),
            onDaySelected: (date, date2) {
              setState(() {
                dateTime = date2;
                widget.callback(dateTime);
              });
            },
          ),
        ],
      ),
    );
  }
}
