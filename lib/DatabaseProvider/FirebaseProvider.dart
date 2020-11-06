import 'dart:async';

import 'package:blog_app/AppHelper/AppDataHelper.dart';
import 'package:blog_app/DatabaseProvider/DatabaseKeyName.dart';
import 'package:blog_app/Model/Post.dart';
import 'package:blog_app/Model/Voted.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebaseProvider extends ChangeNotifier {
  DatabaseKeyName dkn;

  Future<bool> registration({name, email, nid, number}) async {
    print("Name is  :  ${name}");
    print("email is  :  ${email}");
    print("nid is  :  ${nid}");
    print("number is  :  ${number}");

    bool registrationSuccess = false;

    await FirebaseDatabase.instance
        .reference()
        .child(DatabaseKeyName.child_user)
        .child(number)
        .set({
      DatabaseKeyName.name: name,
      DatabaseKeyName.email: email,
      DatabaseKeyName.nid: nid,
    }).then((value) {
      registrationSuccess = true;
    });

    return registrationSuccess;
  }

  Stream<List<Post>> streamAllPost() {
    StreamController<List<Post>> _stream_controller = new StreamController();

    List<Post> post_list = new List();

    Stream<Event> data = FirebaseDatabase.instance
        .reference()
        .child(DatabaseKeyName.post)
        .onValue;

    data.listen((event) {
      print(event.snapshot.value);

      post_list.clear();

      // List<Url> url_list = new List();
      Map<dynamic, dynamic> post = event.snapshot.value;

      post.forEach((key, value) {
        post_list.add(Post.loadData(value: value));
        /* post_list.add(new Post(
            title: value["title"],
            user: value["user"],
            type: value["type"],
            time: value["time"],
            url: value["url"],
            description: value["description"] ,
            poll_data_list: value["poll_data_list"],
            voted_list: value["voted_list"]));*/
      });

      _stream_controller.add(post_list);
    });

    return _stream_controller.stream;
  }
}
