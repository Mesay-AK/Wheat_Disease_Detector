abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImageSelected extends ImageState {
  final String filePath;
  ImageSelected(this.filePath);
}