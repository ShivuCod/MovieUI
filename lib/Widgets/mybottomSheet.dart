import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Service/dbHelper.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bottom extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.black87),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => ref.read(currentPage.notifier).state=0,
            child:const Icon(
              FontAwesomeIcons.house,
              size: 15,
              color: Colors.white,
            ),
          ),
          GestureDetector(
                       onTap: () => ref.read(currentPage.notifier).state=1,

            child:const Icon(
              FontAwesomeIcons.bell,
              size: 15,
              color: Colors.grey,
            ),
          ),
          GestureDetector(
                        onTap: () => ref.read(currentPage.notifier).state=2,

            child:const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 15,
              color: Colors.grey,
            ),
          ),
          GestureDetector(
            onTap: () => ref.read(currentPage.notifier).state=3,
            
            child:const Icon(
              FontAwesomeIcons.user,
              size: 15,
              color: Colors.grey,
            ),
          ),
          IconButton(onPressed: ()async{
        await DbHelper().deleteToken();
                                 ref.read(statusNotifier.notifier).state = Future.value("Logged out");

      },icon: const Icon(Icons.logout,color: Colors.grey,))
        ],
      ),
    );
  }
}
