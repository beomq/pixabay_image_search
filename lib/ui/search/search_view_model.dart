import 'package:flutter/material.dart';
import 'package:image_search/api/api.dart';
import 'package:image_search/model/hits_model.dart';

class SearchViewModel with ChangeNotifier {
  final api = Api();

  List<Hits> _images = [];
  List<Hits> get images => _images;

  SearchViewModel() {
    loadImages();
  }

  Future<void> loadImages() async {
    _images = await api.getImages('');
    notifyListeners();
  }

  void onSearchSubmitted(String searchText) async {
    _images = await api.getImages(searchText);
    notifyListeners();
  }

  Future<void> getImages(String query) async {
    _images = await api.getImages(query);
    notifyListeners();
  }
}
