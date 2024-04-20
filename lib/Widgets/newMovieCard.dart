import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewMCard extends ConsumerWidget {
  const NewMCard({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin:const  EdgeInsets.only(top: 10,right: 10),
    
      width: 150,
      height: 200,
      decoration: const BoxDecoration(
        borderRadius:BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: NetworkImage(
                  "https://i1.wp.com/moviesandmania.com/wp-content/uploads/2021/03/Sensation-movie-film-sci-fi-mystery-thriller-2021-Eugene-Simon-poster.jpg?fit=1600%2C2366&ssl=1"),
                  fit: BoxFit.cover),
                  ),
    );
  }
}
