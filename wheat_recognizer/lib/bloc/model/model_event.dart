abstract class ModelEvent {}

class PredictionButtonTriggered extends ModelEvent {
  final String imageFilePath;
  PredictionButtonTriggered(this.imageFilePath);
}
