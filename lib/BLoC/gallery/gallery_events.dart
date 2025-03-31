abstract class GalleryEvents {}

class FetchGallery extends GalleryEvents {}



class AddGallery extends GalleryEvents {
  final String name;
  final String url;
  final String description;

  AddGallery(
      {required this.description, required this.name, required this.url});
}

class UpdateGallery extends GalleryEvents {
  final int id;
  final String name;
  final String url;
  final String description;

  UpdateGallery(
      {required this.description,
      required this.id,
      required this.name,
      required this.url});
}

class DeleteGallery extends GalleryEvents {
  final int id;

  DeleteGallery({required this.id});
}