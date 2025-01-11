abstract class ModelPredictionState {}

class InitialModelPredictionState extends ModelPredictionState {}

class ModelPredictionLoadingState extends ModelPredictionState {}

class ModelPredictionSuccessState extends ModelPredictionState {
  final String prediction;
  ModelPredictionSuccessState(this.prediction);
}

class ModelPredictionErrorState extends ModelPredictionState {
  final String errorMessage;
  ModelPredictionErrorState(this.errorMessage);
}
