import 'package:ai_solution/data/vos/gallery_vo.dart';

abstract class GalleryRepo {

  Future<List<GalleryVO>> fetchAllGalleries();
}