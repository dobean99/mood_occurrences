import 'package:flutter/material.dart';
import 'package:mood_occurrences/config/assets/assets.dart';
import 'package:mood_occurrences/core/constants/app_constants.dart';
import 'package:mood_occurrences/screens/anxious_screen.dart';
import 'package:mood_occurrences/screens/energetic_screen.dart';
import 'package:mood_occurrences/screens/lethargic_screen.dart';
import 'package:mood_occurrences/screens/mindful_screen.dart';
import 'package:mood_occurrences/screens/provider/theme_provider.dart';
import 'package:mood_occurrences/screens/shared/commons/base_layout.dart';
import 'package:mood_occurrences/screens/shared/commons/circle_stroke_button.dart';
import 'package:mood_occurrences/screens/shared/commons/parallelogram_button.dart';
import 'package:mood_occurrences/screens/shared/commons/rounded_container.dart';
import 'package:mood_occurrences/screens/stressed_screen.dart';
import 'package:provider/provider.dart';

class MyMoodTodayScreen extends StatelessWidget {
  const MyMoodTodayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        body: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Column(
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
                  color: themeProvider.themeColor,
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
              ParallelogramButton(
                color: themeProvider.themeColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StressedScreen()),
                  );
                },
                text: "Stressed",
              ),
              const SizedBox(
                height: 20,
              ),
              ParallelogramButton(
                color: themeProvider.themeColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EnergeticScreen()),
                  );
                },
                text: "Energetic",
              ),
              const SizedBox(
                height: 20,
              ),
              ParallelogramButton(
                color: themeProvider.themeColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AnxiousScreen()),
                  );
                },
                text: "Anxious",
              ),
              const SizedBox(
                height: 20,
              ),
              ParallelogramButton(
                color: themeProvider.themeColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MindfulScreen()),
                  );
                },
                text: "Mindful",
              ),
            ],
          ),
        ],
      );
    }));
  }
}
