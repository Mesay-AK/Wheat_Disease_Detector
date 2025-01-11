import 'package:flutter/material.dart';
import 'package:wheat_recognizer/presentation/styles/text_style.dart';
import 'package:wheat_recognizer/presentation/widgets/drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const CustomDrawer(),
      body: const Column(
        children: [
          Text(
            "About this Application",
            style: aboutHeaderTextStyle,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "WheatGuard is a mobile application designed to help farmers and agricultural professionals monitor the health of their wheat crops. Using advanced machine learning algorithms, the app analyzes photos taken by the user to detect signs of common wheat diseases, such as wheat rust. With its easy-to-use interface, WheatGuard allows users to capture images of their crops, and within seconds, the app provides an assessment of the disease status, offering valuable insights for better decision-making.",
              style: aboutContentTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
