import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wheat_recognizer/bloc/model/model_bloc.dart';
import 'package:wheat_recognizer/bloc/model/model_state.dart';
import 'package:wheat_recognizer/presentation/styles/button_style.dart';
import 'package:wheat_recognizer/presentation/styles/text_style.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ModelBloc, ModelPredictionState>(
      listener: (context, state) {
        if (state is ModelPredictionSuccessState) {
          context.go("/prediction");
        } else if (state is ModelPredictionErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text("Failed To load your prediction"),
            action: SnackBarAction(
                label: "Try again", onPressed: () => context.go("/home")),
          ));
        }
      },
      builder: (context, state) {
        return const Scaffold(
            body: Center(
          child: CircularProgressIndicator(),
        ));
      },
    );
  }
}
