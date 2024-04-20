import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Profile",
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: Colors.black38,
              minRadius: 60,
              child: Icon(
                FontAwesomeIcons.user,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
              leading: Icon(
                FontAwesomeIcons.chartLine,
                color: Colors.white,
              ),
              title: Text(
                "Your Activity",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.grey,
              )),
          Divider(),
          SizedBox(height: 5),
          ListTile(
              leading: Icon(
                FontAwesomeIcons.bell,
                color: Colors.white,
              ),
              title: Text(
                "Notifications",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.grey,
              )),
          Divider(),
          SizedBox(height: 5),
          ListTile(
              leading: Icon(
                FontAwesomeIcons.clock,
                color: Colors.white,
              ),
              title: Text(
                "Time spent",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.grey,
              )),
          Divider(),
          SizedBox(height: 5),
          ListTile(
              leading: Icon(
                FontAwesomeIcons.circleQuestion,
                color: Colors.white,
              ),
              title: Text(
                "About",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.grey,
              )),
          Divider(),
        ],
      ),
    );
  }
}
