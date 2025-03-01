import 'package:ai_solution/data/vos/gallery_vo.dart';
import 'package:ai_solution/domain/gallery_repo.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseGalleryRepo implements GalleryRepo {
  final databaseRef = FirebaseDatabase.instance.ref();
  @override
  Future<List<GalleryVO>> fetchAllGalleries() async {
    try {
      final snapshot = await databaseRef.child("gallery").once();
      return snapshot.snapshot.children.map<GalleryVO>((snapshot) {
        return GalleryVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    } catch (error) {
      throw Exception("Error fetching galleries: $error");
    }
  }
}
