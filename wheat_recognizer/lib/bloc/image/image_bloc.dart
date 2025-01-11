import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheat_recognizer/bloc/image/image_event.dart';
import 'package:wheat_recognizer/bloc/image/image_state.dart';
import 'dart:async';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageInitial()) {
    on<SelectImageEvent>(_onSelectImageEvent);
  }

  FutureOr<void> _onSelectImageEvent(
      SelectImageEvent event, Emitter<ImageState> emit) {
    emit(ImageSelected(event.filePath));
  }
}
