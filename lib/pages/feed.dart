import 'package:app_starter_template/widgets/card.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
          children: <Widget>[
            ReusableCard(
              colour: Colors.green,
              cardChild: Text("Users"),
            ),
            ReusableCard(
              colour: Colors.amber,
              cardChild: Text("Settings"),
            )
          ],
        )
    );
  }
}
