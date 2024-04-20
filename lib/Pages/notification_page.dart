import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Notifications extends ConsumerWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Notifications",
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Column(
            children: List.generate(
                9,
                (index) => Container(
                      margin: const EdgeInsets.only(top: 18),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Bollywood vs Reality",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14)),
                              SizedBox(height: 3),
                              Text(
                                  "Funny compilation That is Going VIRAL on Jio...",
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 10)),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.network(
                              "https://th.bing.com/th/id/OIP.Uk_6WtJQBgWBRZJwoOp8oQAAAA?w=454&h=654&rs=1&pid=ImgDetMain",
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover)
                        ],
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
