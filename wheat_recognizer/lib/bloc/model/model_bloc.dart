import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheat_recognizer/bloc/image/image_event.dart';
import 'package:wheat_recognizer/bloc/image/image_state.dart';
import 'dart:async';
import 'package:wheat_recognizer/model/model.dart';

import 'package:wheat_recognizer/bloc/model/model_event.dart';
import 'package:wheat_recognizer/bloc/model/model_state.dart';

class ModelBloc extends Bloc<ModelEvent, ModelPredictionState> {
  WheatDiseaseRecognitionModel model = WheatDiseaseRecognitionModel();

  ModelBloc() : super(InitialModelPredictionState()) {
    on<PredictionButtonTriggered>(_onPredictionButtonTriggered);
  }

  Future<void> _onPredictionButtonTriggered(PredictionButtonTriggered event,
      Emitter<ModelPredictionState> emit) async {
    try {
      emit(ModelPredictionLoadingState());

      await model.loadModel();
      await model.loadClasses();

      String prediction = await model.runModel(File(event.imageFilePath));

      emit(ModelPredictionSuccessState(prediction));
    } catch (e) {
      emit(ModelPredictionErrorState("Failed to run prediction: $e"));
    }
  }
}