import 'dart:io';
import 'dart:typed_data';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class WheatDiseaseRecognitionModel {
  late Interpreter _interpreter;
  List<String> _classes = [];
  String _predicted = "Undefined";

  Future<void> loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset("assets/model.tflite");
    } catch (e) {
      print("Error loading model: $e");
    }
  }

  Future<void> loadClasses() async {
    _classes = ["Leaf rust", "Loose smut", "Crown root rot", "Healthy"];
  }

  Future<String> runModel(File imageFile) async {
    try {
      final image = img.decodeImage(await imageFile.readAsBytes())!;

      const imgSize = 64;
      final resizedImage =
          img.copyResize(image, width: imgSize, height: imgSize);
      final inputBuffer = Float32List(imgSize * imgSize * 3);
      for (int i = 0; i < imgSize; i++) {
        for (int j = 0; j < imgSize; j++) {
          final pixel = resizedImage.getPixel(j, i);
          final index = (i * imgSize + j) * 3;

          inputBuffer[index] = img.getBlue(pixel).toDouble() / 255.0;
          inputBuffer[index + 1] = img.getGreen(pixel).toDouble() / 255.0;
          inputBuffer[index + 2] = img.getRed(pixel).toDouble() / 255.0;
        }
      }

      final outputBuffer = Float32List(4).reshape([1, 4]);

      _interpreter.run(
          inputBuffer.reshape([1, imgSize, imgSize, 3]), outputBuffer);

      final prediction = outputBuffer[0];
      final roundedPrediction =
          prediction.map((value) => value.round()).toList();
      // print('Prediction: $prediction');
      final predictedIndex = roundedPrediction.indexOf(1);
      // print('predictedIndex: $predictedIndex');
      _predicted =
          predictedIndex != -1 ? _classes[predictedIndex] : "Unknown Class";
      return _predicted;
    } catch (e) {
      return _predicted;
    }
  }
}
