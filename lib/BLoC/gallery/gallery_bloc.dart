import 'package:ai_solution/BLoC/gallery/gallery_events.dart';
import 'package:ai_solution/BLoC/gallery/galllery_states.dart';
import 'package:ai_solution/data/vos/gallery_vo.dart';
import 'package:ai_solution/domain/admin_repo.dart';
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

class AddGallerysBloc extends Bloc<GalleryEvents, AddGalleryStates> {
  final AdminRepo adminRepo;

  AddGallerysBloc({required this.adminRepo}) : super(AddGalleryInitial()) {
    on<AddGallery>(_onAddGallery);
  }

  Future _onAddGallery(AddGallery event, Emitter<AddGalleryStates> emit) async {
    try {
      emit(AddGalleryLoading());

      int id = DateTime.now().millisecondsSinceEpoch;

      final GalleryVO solution = GalleryVO(
        id: id,
        name: event.name.isEmpty ? "Default" : event.name,
        url: event.url.isEmpty
            ? "https://cdn.cs.1worldsync.com/syndication/mediaserverredirect/9c761667cec1f9964212eb7ef2874bf8/original.png"
            : event.url,
        description: event.description.isEmpty ? "...... " : event.description,
      );

      await adminRepo.saveGallery(solution).then(
        (value) {
          emit(GalleryAdded("Gallery added successfully!"));
        },
      );
    } catch (error) {
      emit(AddGalleryError('$error'));
    }
  }
}

class UpdateGallerysBloc extends Bloc<GalleryEvents, UpdateGalleryStates> {
  final AdminRepo adminRepo;

  UpdateGallerysBloc({required this.adminRepo})
      : super(UpdateGalleryInitial()) {
    on<UpdateGallery>(_onUpdateGallery);
  }

  Future _onUpdateGallery(
      UpdateGallery event, Emitter<UpdateGalleryStates> emit) async {
    try {
      emit(UpdateGalleryLoading());

      final GalleryVO solution = GalleryVO(
        id: event.id,
        name: event.name.isEmpty ? "Default" : event.name,
        url: event.url,
        description: event.description.isEmpty ? "...... " : event.description,
      );

      await adminRepo.saveGallery(solution).then(
        (value) {
          emit(GalleryUpdated("Gallery updated successfully!"));
        },
      );
    } catch (error) {
      emit(UpdateGalleryError('$error'));
    }
  }
}

class DeleteGallerysBloc extends Bloc<GalleryEvents, DeleteGalleryStates> {
  final AdminRepo adminRepo;

  DeleteGallerysBloc({required this.adminRepo})
      : super(DeleteGalleryInitial()) {
    on<DeleteGallery>(_onDeleteGallery);
  }

  Future _onDeleteGallery(
      DeleteGallery event, Emitter<DeleteGalleryStates> emit) async {
    try {
      emit(DeleteGalleryInitial());

      await adminRepo.deleteGallery(event.id).then(
        (value) {
          emit(GalleryDeleted("Gallery deleted successfully!"));
        },
      );
    } catch (error) {
      emit(DeleteGalleryError('$error'));
    }
  }
}
