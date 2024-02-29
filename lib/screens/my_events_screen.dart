import 'package:flutter/material.dart';
import 'package:mood_occurrences/config/assets/assets.dart';
import 'package:mood_occurrences/core/constants/app_colors.dart';
import 'package:mood_occurrences/core/constants/app_constants.dart';
import 'package:mood_occurrences/screens/provider/theme_provider.dart';
import 'package:mood_occurrences/screens/shared/commons/base_layout.dart';
import 'package:mood_occurrences/screens/shared/commons/circle_stroke_button.dart';
import 'package:mood_occurrences/screens/shared/commons/parallelogram_button.dart';
import 'package:mood_occurrences/screens/shared/commons/rounded_container.dart';
import 'package:provider/provider.dart';

class MyEventsScreen extends StatefulWidget {
  const MyEventsScreen({Key? key}) : super(key: key);

  @override
  _MyEventsScreenState createState() => _MyEventsScreenState();
}

class _MyEventsScreenState extends State<MyEventsScreen> {
  bool showNoteWidget = false;

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
              if (showNoteWidget)
                Expanded(
                    child: SingleChildScrollView(
                        child: NoteWidget(
                  color: themeProvider.themeColor,
                ))),
            ],
          );
        },
      ),
    );
  }
}

class NoteWidget extends StatelessWidget {
  final Color? color;

  const NoteWidget({super.key, this.color});

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
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppConstants.textFieldFontSize,
                            fontWeight: FontWeight.w900),
                        decoration: InputDecoration(
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppConstants.textFieldFontSize,
                            fontWeight: FontWeight.w900),
                        decoration: InputDecoration(
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
                )),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        ParallelogramButton(
            color: color ?? AppColors.redColor,
            onPressed: () {},
            text: "Create an event"),
      ],
    );
  }
}
