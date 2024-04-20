import 'package:flutter_application_1/Models/user.dart';
import 'package:flutter_application_1/Service/dbHelper.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:pocketbase/pocketbase.dart';

class PocketbaseService {
  final pb = PocketBase('http://127.0.0.1:8090');

  Future<bool> isLogged() async {
    if (DbHelper().getToken().toString().isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signIn(String username, password) async {
    try {
      final response =
          await pb.collection("users").authWithPassword(username, password);
      await DbHelper().saveToken(response.token);
      return true;
    } catch (e) {
      Fluttertoast.showToast(msg: "Try Later");
      return false;
    }
  }

  Future<bool> signUp(User user)async{
    
    try {
     
        final response=await pb.collection("users").create(body:user.toJson() );
        print(response);
        
      return true;
    } catch (e) {
      Fluttertoast.showToast(msg: "Try Later");
      return false;
    }
  }
}
