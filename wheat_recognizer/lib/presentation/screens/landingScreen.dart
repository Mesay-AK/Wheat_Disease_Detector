import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wheat_recognizer/presentation/styles/button_style.dart';
import 'package:wheat_recognizer/presentation/styles/text_style.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/home_background.png"),
              fit: BoxFit.cover),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Image(image: AssetImage("images/logo.png")),
              const Text("Your Pocket \n Wheat Doctor.",
                  textAlign: TextAlign.center, style: landingTextStyle),
              ElevatedButton(
                onPressed: () => {context.go("/home")},
                style: raisedButtonStyle,
                child: const Text(
                  "GET STARTED",
                  style: TextStyle(fontSize: 20, fontFamily: 'Albert-Sans'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
