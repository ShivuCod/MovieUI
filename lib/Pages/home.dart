import 'package:flutter/material.dart';

import 'package:flutter_application_1/Pages/home_page.dart';
import 'package:flutter_application_1/Pages/notification_page.dart';
import 'package:flutter_application_1/Pages/profile.dart';
import 'package:flutter_application_1/Pages/search.dart';
import 'package:flutter_application_1/Widgets/mybottomSheet.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final page=ref.watch(currentPage);
  
    return Scaffold(
      extendBodyBehindAppBar: true,
     
      backgroundColor: Colors.black87,
     
      body: Stack(
        children: [
          page==0?const Home():page==1?const Notifications():page==2?const Search():const Profile(),
          Positioned(
            bottom: 5,
            left: 5,
            right: 5,
            child:Bottom())
        ],
      ),
    );
  }
}
