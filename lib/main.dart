import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/home.dart';
import 'package:flutter_application_1/Pages/login.dart';
import 'package:flutter_application_1/Service/pocketbase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

//for static data
final data = FutureProvider((ref) => [
      {
        "id": 1,
        "name": "Regular Noddles",
        "desc":
            "Eating is a fundamental part of every person’s day. As people learn more about the relationship between food and wellness",
        "rating": 3.2,
        "image":
            "https://th.bing.com/th/id/R.7d2eddad77a50335d2708f00642a56d1?rik=XyfrmbxRIatpfA&riu=http%3a%2f%2fgraphicdesignjunction.com%2fwp-content%2fuploads%2f2012%2f05%2flarge%2fmovie-poster-20.jpg&ehk=L0vMiRR8cSqB4qAyA1wUB4gxnEZh4rQAl5CvUb6K6%2bo%3d&risl=&pid=ImgRaw&r=0"
      },
      {
        "id": 1,
        "name": "Regular Noddles",
        "desc":
            "Eating is a fundamental part of every person’s day. As people learn more about the relationship between food and wellness",
        "rating": 3.2,
        "image":
            "https://m.media-amazon.com/images/M/MV5BNDIxMTA5MTM2NV5BMl5BanBnXkFtZTgwNTQ5MzczOTE@._V1_UY1200_CR104,0,630,1200_AL_.jpg"
      },
      {
        "id": 1,
        "name": "Regular Noddles",
        "desc":
            "Eating is a fundamental part of every person’s day. As people learn more about the relationship between food and wellness",
        "rating": 3.2,
        "image":
            "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"
      },
      {
        "id": 1,
        "name": "Regular Noddles",
        "desc":
            "Eating is a fundamental part of every person’s day. As people learn more about the relationship between food and wellness",
        "rating": 3.2,
        "image":
            "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"
      }
    ]);

//page index ex 0 for home
final currentPage = StateProvider((ref) => 0);

//user logged or not
final statusNotifier = StateProvider((ref) async {
  final isLogged = await PocketbaseService().isLogged();
  return isLogged ? "Logged in" : "Logged out";
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(statusNotifier);


return MaterialApp(
  debugShowCheckedModeBanner: false,
  home: FutureBuilder<String>(
    future: status,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // Future is still loading
        return const CircularProgressIndicator(); // or any loading indicator
      } else {
        if (snapshot.data == 'Logged in') {
          return const MainPage();
        } else {
          return const Login();
        }
      }
    },
  ),
);
  }
}
