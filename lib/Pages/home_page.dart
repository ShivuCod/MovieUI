import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Widgets/infinateDragable.dart';
import 'package:flutter_application_1/Widgets/newMovieCard.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hii Flutter",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                      Text(
                        "Welcome to Movie App! ",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"),
                        minRadius: 28,
                      ),
                      Positioned(
                          top: 0.6,
                          right: 0.6,
                          child: CircleAvatar(
                            backgroundColor: Colors.greenAccent,
                            minRadius: 8,
                          ))
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "For you",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 26,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                 const Center(child:  InfiniteDragableWidget()),
                       
                    const SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                            5,
                            (index) => const Padding(
                                  padding: EdgeInsets.all(3),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    minRadius: 5,
                                  ),
                                )),
                      ))
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "New Movies",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 26,
                    fontWeight: FontWeight.w300),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(5, (index) => const NewMCard())),
              ),
              const Text(
                "Popular",
                style: TextStyle(fontSize: 28, color: Colors.grey),
              ),
              const SizedBox(height: 2),
              StreamBuilder(
                stream: ref.watch(data).when(
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
                        children: List.generate(
                            snapshot.data!.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(snapshot
                                                    .data![index]["image"]
                                                    .toString()),
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
                                              snapshot.data![index]["name"]
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            Text(
                                                snapshot.data![index]["desc"]
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

