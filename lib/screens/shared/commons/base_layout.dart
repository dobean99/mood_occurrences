import 'package:flutter/material.dart';
import 'package:mood_occurrences/config/assets/png_assets.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({super.key, this.bottomButton, this.body, this.headerText});
  final String? headerText;
  final Widget? body;
  final Widget? bottomButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(PngAssets.menuBG),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: body ?? Container(),
          )),
    );
  }
}
