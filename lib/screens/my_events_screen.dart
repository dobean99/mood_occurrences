import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mood_occurrences/config/assets/assets.dart';
import 'package:mood_occurrences/config/models/event_model.dart';
import 'package:mood_occurrences/core/constants/app_colors.dart';
import 'package:mood_occurrences/core/constants/app_constants.dart';
import 'package:mood_occurrences/screens/provider/theme_provider.dart';
import 'package:mood_occurrences/screens/shared/commons/base_layout.dart';
import 'package:mood_occurrences/screens/shared/commons/circle_stroke_button.dart';
import 'package:mood_occurrences/screens/shared/commons/custom_datet_time.dart';
import 'package:mood_occurrences/screens/shared/commons/device_size.dart';
import 'package:mood_occurrences/screens/shared/commons/parallelogram_button.dart';
import 'package:mood_occurrences/screens/shared/commons/rounded_container.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyEventsScreen extends StatefulWidget {
  const MyEventsScreen({Key? key}) : super(key: key);

  @override
  _MyEventsScreenState createState() => _MyEventsScreenState();
}

class _MyEventsScreenState extends State<MyEventsScreen> {
  bool showNoteWidget = false;
  List<EventModel> stats = [];
  late EventModel today =
      EventModel(date: dateSelected, title: '', description: '');
  DateTime dateSelected = DateTime.now();
  String title = "";
  @override
  void initState() {
    getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      background: PngAssets.eventThemeBG,
      body: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CircleStrokeButton(
                        iconPath: PngAssets.back,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: RoundedContainer(
                      color: themeProvider.themeColor,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 60),
                        child: Text(
                          "My Event",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: AppConstants.titleFontSize,
                              fontWeight: FontWeight.w900),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    child: CircleStrokeButton(
                      iconPath: PngAssets.add,
                      onPressed: () {
                        setState(() {
                          showNoteWidget = true;
                        });
                      },
                    ),
                  ),
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            renderDate(stats[index].date),
                            style: TextStyle(
                                color: themeProvider.themeColor,
                                fontSize: AppConstants.titleFontSize,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      ParallelogramButton(
                          color: themeProvider.themeColor,
                          onPressed: () {},
                          text: stats[index].title)
                    ],
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemCount: stats.length,
              ),
              if (showNoteWidget)
                Expanded(
                  child: SingleChildScrollView(
                    child: NoteWidget(
                      color: themeProvider.themeColor,
                      onPressed: () {
                        today = EventModel(
                            date: dateSelected, title: title, description: "");
                        stats.add(today);
                        saveList(stats);
                        title = '';
                        setState(() {
                          showNoteWidget = false;
                        });
                      },
                      onPressedCalender: () async {
                        DateTime date = await showCustomDateDialog(
                            context, themeProvider.themeColor);
                        dateSelected = date;
                        setState(() {});
                      },
                      onEventNameChanged: (eventName) {
                        title = eventName;
                        setState(() {});
                      },
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Future<DateTime> showCustomDateDialog(
      BuildContext context, Color color) async {
    DateTime dateTime = DateTime.now();

    await showDialog<DateTime>(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: SizedBox(
          width: DeviceSize.width(context, partNumber: 10),
          height: DeviceSize.height(context, partNumber: 5) + 50,
          child: CustomDateTime(
              mainColor: color,
              callback: (DateTime newDateTime) {
                dateTime = newDateTime;
              }),
        ),
      ),
    );
    return dateTime;
  }

  renderDate(DateTime date) {
    String text = "";
    return "$text${DateFormat('dd.MM.yyyy').format(date)}";
  }

  void saveList(List<EventModel> list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedList =
        list.map((item) => jsonEncode(item.toJson())).toList();
    prefs.setStringList('event_list', encodedList);
  }

  Future<void> getList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? encodedList = prefs.getStringList('event_list');
    setState(() {
      if (encodedList != null) {
        stats = encodedList
            .map((String item) => EventModel.fromJson(jsonDecode(item)))
            .toList();
        stats.sort((a, b) => b.date.compareTo(a.date));
      }
    });
  }
}

class NoteWidget extends StatefulWidget {
  final Color? color;
  final VoidCallback onPressed;
  final VoidCallback onPressedCalender;
  final Function(String) onEventNameChanged; // Callback for event name change

  const NoteWidget(
      {super.key,
      this.color,
      required this.onPressed,
      required this.onPressedCalender,
      required this.onEventNameChanged});

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 450,
                decoration: const BoxDecoration(
                    color: AppColors.greyColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: TextField(
                        onChanged: (eventName) {
                          widget.onEventNameChanged(
                              eventName); // Pass the event name to the callback
                        },
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppConstants.textFieldFontSize,
                            fontWeight: FontWeight.w900),
                        decoration: const InputDecoration(
                          hintText: 'Name of the event',
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 5,
                                color: AppColors
                                    .whiteColor), // Specify the underline color
                          ),
                          hintStyle: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: AppConstants.textFieldFontSize,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: TextField(
                        controller: myController,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppConstants.textFieldFontSize,
                            fontWeight: FontWeight.w900),
                        decoration: const InputDecoration(
                          hintText: 'Description',
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 20,
                                color: AppColors
                                    .redColor), // Specify the underline color
                          ),
                          hintStyle: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: AppConstants.textFieldFontSize,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 0,
                child: CircleStrokeButton(
                    iconPath: PngAssets.calendar,
                    onPressed: widget.onPressedCalender)),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        ParallelogramButton(
            color: widget.color ?? AppColors.redColor,
            onPressed: widget.onPressed,
            text: "Create an event"),
      ],
    );
  }
}
