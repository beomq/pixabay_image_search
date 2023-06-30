import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_search/model/hits_model.dart';

class Api {
  final String apiKey = '37726342-d9be0ba7c04a039911124abfd';
  final String baseUrl = 'http://pixabay.com/api/';

  Future<List<Hits>> getImages(String query) async {
    final response = await http.get(Uri.parse(
        '$baseUrl?key=$apiKey&q=$query&image_type=photo&pretty=true'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      List<Hits> images =
          (jsonData['hits'] as List).map((e) => Hits.fromJson(e)).toList();

      return images;
    } else {
      throw Exception('이미지 로드에 실패했습니다');
    }
  }
}
