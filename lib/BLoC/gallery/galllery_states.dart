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

abstract class AddGalleryStates {}

class AddGalleryInitial extends AddGalleryStates {}

class AddGalleryLoading extends AddGalleryStates {}

class AddGalleryError extends AddGalleryStates {
  final String message;

  AddGalleryError(this.message);
}

class GalleryAdded extends AddGalleryStates {
  final String message;

  GalleryAdded(this.message);
}

abstract class UpdateGalleryStates {}

class UpdateGalleryInitial extends UpdateGalleryStates {}

class UpdateGalleryLoading extends UpdateGalleryStates {}

class UpdateGalleryError extends UpdateGalleryStates {
  final String message;

  UpdateGalleryError(this.message);
}

class GalleryUpdated extends UpdateGalleryStates {
  final String message;

  GalleryUpdated(this.message);
}

abstract class DeleteGalleryStates {}

class DeleteGalleryInitial extends DeleteGalleryStates {}

class DeleteeCurrentSolutionLoading extends DeleteGalleryStates {}

class DeleteGalleryError extends DeleteGalleryStates {
  final String message;

  DeleteGalleryError(this.message);
}

class GalleryDeleted extends DeleteGalleryStates {
  final String message;

  GalleryDeleted(this.message);
}
