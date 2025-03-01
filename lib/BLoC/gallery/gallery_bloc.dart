import 'package:ai_solution/BLoC/gallery/gallery_events.dart';
import 'package:ai_solution/BLoC/gallery/galllery_states.dart';
import 'package:ai_solution/domain/gallery_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryBloc extends Bloc<GalleryEvents, GalleryStates> {
  final GalleryRepo galleryRepo;

  GalleryBloc({required this.galleryRepo}) : super(GalleryInitial()) {
    on<FetchGallery>(_onFetchGallery);
  }

  Future _onFetchGallery(
      FetchGallery event, Emitter<GalleryStates> emit) async {
    try {
      emit(GalleryLoading());
      final fetchedGallery = await galleryRepo.fetchAllGalleries();

      emit(GalleryLoaded(fetchedGallery));
    } catch (error) {
      emit(GalleryError('$error'));
    }
  }
}
