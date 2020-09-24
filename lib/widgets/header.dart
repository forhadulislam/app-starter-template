import 'package:flutter/material.dart';

AppBar header(context) {
  return AppBar(
    title: Text(
      "Point",
      style: TextStyle(
        color: Colors.white,
        fontFamily: "Signatra",
        fontSize: 50,
      ),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).accentColor,
  );
}
