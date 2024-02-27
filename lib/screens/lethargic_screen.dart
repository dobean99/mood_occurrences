import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_occurrences/config/assets/assets.dart';
import 'package:mood_occurrences/core/constants/app_colors.dart';
import 'package:mood_occurrences/core/constants/app_constants.dart';
import 'package:mood_occurrences/screens/shared/commons/base_layout.dart';
import 'package:mood_occurrences/screens/shared/commons/circle_stroke_button.dart';
import 'package:mood_occurrences/screens/shared/commons/rounded_container.dart';

class LethargicScreen extends StatelessWidget {
  const LethargicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      body: SingleChildScrollView(
        child: Column(
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
                    padding:
                        EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
                    child: Text(
                      "Lethargic",
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
            const Text(
              "When you're feeling lethargic, there are several strategies you can try to help boost your energy levels:",
              style: TextStyle(
                  fontSize: AppConstants.bigButtonFontSize,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textColor),
              textAlign: TextAlign.center,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AppConstants.arrStringLethargic.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Image.asset(AppConstants.arrImageLethargic[index]),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: AppConstants.bigButtonFontSize,
                              fontFamily: GoogleFonts.alumniSans().fontFamily,
                            ),
                            children: [
                              TextSpan(
                                  text: "${index + 1}. ",
                                  style: const TextStyle(
                                      color: AppColors.redColor)),
                              TextSpan(
                                  text: AppConstants.arrStringLethargic[index],
                                  style: const TextStyle(
                                      color: AppColors.textColor))
                            ]),
                      ),
                    ],
                  );
                }),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "“Were these tips helpful?”",
                  style: TextStyle(
                      color: AppColors.redColor,
                      fontSize: AppConstants.titleFontSize,
                      fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CircleStrokeButton(
                    iconPath: PngAssets.like,
                    onPressed: () => {},
                  ),
                  CircleStrokeButton(
                    iconPath: PngAssets.dislike,
                    onPressed: () => {},
                  ),
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }
}
