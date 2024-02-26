import 'package:flutter/material.dart';
import 'package:mood_occurrences/config/assets/assets.dart';
import 'package:mood_occurrences/core/constants/app_constants.dart';
import 'package:mood_occurrences/screens/my_mood_today_screen.dart';
import 'package:mood_occurrences/screens/shared/commons/base_layout.dart';
import 'package:mood_occurrences/screens/shared/commons/circle_stroke_button.dart';
import 'package:mood_occurrences/screens/shared/commons/parallelogram_button.dart';
import 'package:mood_occurrences/screens/shared/commons/rounded_container.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RoundedContainer(
            child: IntrinsicWidth(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Stack(
                  children: [
                    Positioned(
                        left: -10,
                        top: 0,
                        child: Image.asset(PngAssets.message)),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Mood\nOccurrences",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AppConstants.titleFontSize,
                            fontWeight: FontWeight.w900),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              ParallelogramButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyMoodTodayScreen()),
                    );
                  },
                  text: "My mood today"),
              const SizedBox(
                height: 40,
              ),
              ParallelogramButton(onPressed: () {}, text: "My Events"),
              const SizedBox(
                height: 40,
              ),
              ParallelogramButton(onPressed: () {}, text: "Event theme"),
            ],
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                child: CircleStrokeButton(iconPath: PngAssets.volunmOn),
              )),
        ],
      ),
    );
  }
}
