import 'package:flutter/material.dart';
import 'package:app_starter_template/models/user.dart';
import 'dart:convert';

class UserList extends StatelessWidget {
  final List<User> items;

  UserList({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Long List';

    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        var post = items[index];

        return ListTile(
          title: Text(post.firstName),
          subtitle: Text(post.gender + "," + post.email),
        );
      },
      itemCount: items.length,
    );
  }
}
