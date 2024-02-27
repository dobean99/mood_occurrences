import 'package:flutter/material.dart';
import 'package:mood_occurrences/config/assets/assets.dart';
import 'package:mood_occurrences/core/constants/app_constants.dart';
import 'package:mood_occurrences/screens/lethargic_screen.dart';
import 'package:mood_occurrences/screens/shared/commons/base_layout.dart';
import 'package:mood_occurrences/screens/shared/commons/circle_stroke_button.dart';
import 'package:mood_occurrences/screens/shared/commons/parallelogram_button.dart';
import 'package:mood_occurrences/screens/shared/commons/rounded_container.dart';

class MyMoodTodayScreen extends StatelessWidget {
  const MyMoodTodayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
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
              const RoundedContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
                  child: Text(
                    "What’s your mood today?\nChoose one of the\nvariants below and\ncheck the activities\nwhich can help you feel\nbetter",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: AppConstants.mediumFontSize,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Column(
            children: [
              ParallelogramButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LethargicScreen()),
                    );
                  },
                  text: "Lethargic"),
              const SizedBox(
                height: 20,
              ),
              ParallelogramButton(onPressed: () {}, text: "Stressed"),
              const SizedBox(
                height: 20,
              ),
              ParallelogramButton(onPressed: () {}, text: "Energetic"),
              const SizedBox(
                height: 20,
              ),
              ParallelogramButton(onPressed: () {}, text: "Anxious"),
              const SizedBox(
                height: 20,
              ),
              ParallelogramButton(onPressed: () {}, text: "Mindful"),
            ],
          ),
        ],
      ),
    );
  }
}
