import 'package:flutter/material.dart';
import 'package:image_search/ui/detail/detail_screen.dart';

import 'package:image_search/ui/search/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String query = '';
  Future<void>? _searchFuture;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchImages(String query) {
    setState(() {
      _searchFuture = context.read<SearchViewModel>().getImages(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SearchViewModel>();
    return Scaffold(
      appBar: AppBar(title: const Text('Image Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () async {
                      query = _searchController.text;
                      _searchImages(query);
                    },
                    child: const Icon(
                      color: (Colors.greenAccent),
                      Icons.search,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<void>(
              future: _searchFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  const Center(child: CircularProgressIndicator());
                } else if (!snapshot.hasData) {
                  const Text('NO Data');
                }

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1,
                  ),
                  itemCount: model.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    final data = model.images[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScreen(data: data)),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Hero(
                          tag: data.id,
                          child: Image.network(
                            data.webformatURL,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
