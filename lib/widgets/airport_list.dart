import 'package:app_starter_template/models/airport.dart';
import 'package:flutter/material.dart';
import 'package:app_starter_template/models/user.dart';
import 'dart:convert';

class AirportList extends StatelessWidget {
  final List<Airport> items;

  AirportList({Key key, @required this.items}) : super(key: key);

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
          title: Text(post.name),
          subtitle: Text(post.city + "," + post.country),
        );
      },
      itemCount: items.length,
    );
  }
}
