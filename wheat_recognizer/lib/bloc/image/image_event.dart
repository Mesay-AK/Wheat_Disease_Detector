abstract class ImageEvent {}

class SelectImageEvent extends ImageEvent {
  final String filePath;
  SelectImageEvent(this.filePath);
}