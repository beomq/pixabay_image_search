// import 'package:go_router/go_router.dart';
// import 'package:image_search/model/hits_model.dart';
// import 'package:image_search/ui/detail/detail_screen.dart';
// import 'package:image_search/ui/search/search_screen.dart';
// import 'package:image_search/ui/search/search_view_model.dart';
// import 'package:provider/provider.dart';
//
// final router = GoRouter(
//   initialLocation: '/',
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => const SearchScreen(),
//     ),
//     GoRoute(
//       path: '/detail',
//       builder: (context, state) {
//         final imageUrl = state.queryParameters['imageUrl']!;
//         final data = Hits(webformatURL: imageUrl, id: 'id');
//         return DetailScreen(data: data);
//       },
//     ),
//   ],
// );
