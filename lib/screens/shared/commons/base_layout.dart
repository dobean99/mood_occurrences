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
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  body ?? Container(),
                ],
              ),
              const Positioned(
                top: 0,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
