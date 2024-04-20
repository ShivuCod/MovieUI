import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

final newMovieProvider = FutureProvider<List<Movie>>((ref) async {

  final response = await http.get(
      Uri.parse("http://127.0.0.1:8090/api/collections/MovieData/records"));
  if (response.statusCode == 200) {
    final records = jsonDecode(response.body);
    final List<Movie> list = [];
    for (var element in records["items"]) {
      list.add(Movie.fromJson(element));
    }
    return list;
  } else {
    return [];
  }
});

class Search extends ConsumerWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(ref.watch(newMovieProvider));
    return Container(height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.white,
                    size: 15,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 53, 53, 53),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide.none)),
            ),
            StreamBuilder(
              stream: ref.watch(newMovieProvider).when(
                    data: (data) => Stream.value(data),
                    error: (error, stackTrace) {
                      if (kDebugMode) {
                        print("faild to fetch");
                      }
                      return null;
                    },
                    loading: () {
                      return null;
                    },
                  ),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                      children: List.generate(
                          snapshot.data!.length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 130,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              onError: (exception, stackTrace) {},
                                              image: const NetworkImage(
                                                  'http://127.0.0.1:8090/api/files/apf08dllpr69kni/gslc5xohu4kt56w/chandu_champion_SYPIC7tazz.jpg?token='),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data![index].name.toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                          Text(
                                              snapshot.data![index].desc
                                                  .toString(),
                                              softWrap: true,
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )));
                }
                return Container();
              },
            ),
            
          ],
        ),
      ),
    );
  }
}
