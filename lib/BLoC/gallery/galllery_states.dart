import 'package:ai_solution/data/vos/gallery_vo.dart';

abstract class GalleryStates {}

class GalleryInitial extends GalleryStates {}

class GalleryLoading extends GalleryStates {}

class GalleryError extends GalleryStates {
  final String message;

  GalleryError(this.message);
}

class GalleryLoaded extends GalleryStates {
  final List<GalleryVO> galleries;

  GalleryLoaded(this.galleries);
}
