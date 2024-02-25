import 'package:flutter/material.dart';
import 'package:mood_occurrences/screens/shared/commons/base_layout.dart';
import 'package:mood_occurrences/screens/shared/commons/custom_buttom.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseLayout(
      body: Column(
        children: [
          CustomButton(
            text: "text",
          )
        ],
      ),
    );
  }
}
