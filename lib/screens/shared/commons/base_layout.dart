import 'package:flutter/material.dart';
import 'package:mood_occurrences/config/assets/png_assets.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout(
      {super.key, this.body, this.headerText, this.onPressed, this.background});
  final String? headerText;
  final Widget? body;
  final VoidCallback? onPressed;
  final String? background;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(background ?? PngAssets.menuBG),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: body ?? Container(),
              )),
        ],
      ),
    );
  }
}
