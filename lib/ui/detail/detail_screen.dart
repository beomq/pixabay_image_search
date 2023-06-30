import 'package:flutter/material.dart';
import 'package:image_search/model/hits_model.dart';

class DetailScreen extends StatelessWidget {
  final Hits data;

  const DetailScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Detail'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Hero(
            tag: data.id,
            child: Image.network(data.webformatURL),
          ),
        ),
      ),
    );
  }
}
