import 'package:flutter/material.dart';
import 'package:js_guru/app/models/image_model.dart';
import 'package:js_guru/app/repositories/images_repository/images_repository.dart';

class ImagesProvider extends ChangeNotifier {
  ImagesProvider() {
    _imagesRepository = ImagesRepository();
  }

  ImagesRepository? _imagesRepository;

  TextEditingController limitController = TextEditingController();

  int start = 0;
  int limit = 10;

  List<ImageModel>? _images = <ImageModel>[];

  List<ImageModel>? get images => _images;

  set setImages(List<ImageModel> value) => _images = value;

  Future<String?> fetchImages() async {
    _images!.clear();
    try {
      _images = await _imagesRepository!.getImages(start.toString(), limit.toString());
      notifyListeners();
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // Update the limit value based on the user input
  Future<void> updateLimit() async {
    limit = int.parse(limitController.text);
    _images!.clear();
    start = 0;
    fetchImages();
  }

  bool imagesNotEmptyOrNull() => _images != null && _images!.isNotEmpty;
}
