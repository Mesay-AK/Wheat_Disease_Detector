import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wheat_recognizer/bloc/image/image_bloc.dart';
import 'package:wheat_recognizer/bloc/image/image_state.dart';
import 'package:wheat_recognizer/bloc/model/model_bloc.dart';
import 'package:wheat_recognizer/bloc/model/model_state.dart';
import 'package:wheat_recognizer/presentation/styles/button_style.dart';
import 'package:wheat_recognizer/presentation/styles/text_style.dart';
import 'package:wheat_recognizer/presentation/widgets/drawer.dart';

class PredictionScreen extends StatelessWidget {
  const PredictionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ModelBloc, ModelPredictionState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ModelPredictionSuccessState) {
          return Scaffold(
            appBar: AppBar(),
            drawer: const CustomDrawer(),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<ImageBloc, ImageState>(builder: (context, state) {
                  if (state is ImageSelected) {
                    return SizedBox(
                        // width: double.infinity,
                        height: 400,
                        child: Image.file(File(state.filePath)));
                  } else {
                    return const Text('No image selected');
                  }
                }),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                  child: Text(
                    "Condition : ${state.prediction}",
                    style: predictionTextStyle,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => context.go("/home"),
                  style: homeIconButtonStyle,
                  child: const Icon(
                    Icons.home,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                )
              ],
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text("Try again."),
            ),
          );
        }
      },
    );
  }
}
