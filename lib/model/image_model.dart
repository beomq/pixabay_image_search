import 'package:image_search/model/hits_model.dart';

class ImageModel {
  ImageModel({
    required this.total,
    required this.totalHits,
    required this.hits,
  });
  late final int total;
  late final int totalHits;
  late final List<Hits> hits;

  ImageModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalHits = json['totalHits'];
    hits = List.from(json['hits']).map((e) => Hits.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['totalHits'] = totalHits;
    _data['hits'] = hits.map((e) => e.toJson()).toList();
    return _data;
  }
}
