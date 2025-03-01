import 'package:ai_solution/data/vos/gallery_vo.dart';
import 'package:ai_solution/domain/gallery_repo.dart';
import 'package:ai_solution/firebase/firebase_gallery_repo.dart';

class GalleryModel implements GalleryRepo{
  GalleryModel._();
  static final GalleryModel _singleton = GalleryModel._();
  factory GalleryModel() => _singleton;
  final _firebaseAgent = FirebaseGalleryRepo();

  @override
  Future<List<GalleryVO>> fetchAllGalleries() async{
      try {
      return await _firebaseAgent.fetchAllGalleries();
    } on Exception catch (error) {
      return Future.error(error);
    }
  }
}