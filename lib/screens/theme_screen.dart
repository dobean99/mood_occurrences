import 'package:flutter/material.dart';
import 'package:mood_occurrences/config/assets/assets.dart';
import 'package:mood_occurrences/core/constants/app_colors.dart';
import 'package:mood_occurrences/core/constants/app_constants.dart';
import 'package:mood_occurrences/screens/provider/theme_provider.dart';
import 'package:mood_occurrences/screens/shared/commons/base_layout.dart';
import 'package:mood_occurrences/screens/shared/commons/circle_color_button.dart';
import 'package:mood_occurrences/screens/shared/commons/circle_stroke_button.dart';
import 'package:mood_occurrences/screens/shared/commons/parallelogram_button.dart';
import 'package:mood_occurrences/screens/shared/commons/rounded_container.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        background: PngAssets.eventThemeBG,
        body: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
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
                  RoundedContainer(
                    color: themeProvider.themeColor,
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
                      child: Text(
                        "Event theme",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AppConstants.titleFontSize,
                            fontWeight: FontWeight.w900),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Column(
                children: [
                  ParallelogramButton(
                      color: themeProvider.themeColor,
                      onPressed: () {},
                      text: "Choose Event theme"),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      CircleColorButton(
                          color: AppColors.yellowColor,
                          onPressed: () {
                            themeProvider.setThemeColor(AppColors.yellowColor);
                          }),
                      CircleColorButton(
                          color: AppColors.greenColor,
                          onPressed: () {
                            themeProvider.setThemeColor(AppColors.greenColor);
                          }),
                      CircleColorButton(
                          color: AppColors.blackColor,
                          onPressed: () {
                            themeProvider.setThemeColor(AppColors.blackColor);
                          }),
                      CircleColorButton(
                        color: AppColors.redColor,
                        onPressed: () {
                          themeProvider.setThemeColor(AppColors.redColor);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        }));
  }
}
