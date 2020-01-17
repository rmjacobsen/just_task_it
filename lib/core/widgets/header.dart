import 'package:flutter/material.dart';


// Set appTitle true whenever no specific title is required.
// Otherwise, use titleText for the desired title.
AppBar buildHeader(context, {bool isAppTitle = false, String titleText}) {
  return AppBar(
    backgroundColor: isAppTitle ? Colors.white : Colors.black,
    title: isAppTitle
        ? Text(
            "Just Task It",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: "go3v2",
              fontSize: 35.0,
            ),
          )
        : Text(titleText),
    elevation: isAppTitle ? 0.0 : 4.0,
  );
}
