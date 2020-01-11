import 'package:flutter/material.dart';

AppBar buildHeader(context, {bool appTitle = false, String titleText}) {
  return AppBar(
    backgroundColor: Colors.white,
    title: appTitle
        ? Text(
            "Just Task It",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: "go3v2",
              fontSize: 35.0,
            ),
          )
        : Text(titleText),
    elevation: appTitle ? 0.0 : 4.0,
  );
}
