import 'package:flutter/material.dart';


buildRoundedButton(context, text, function) {
  return RaisedButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      // side: BorderSide(color: )
      ),
    onPressed: function,
    child: Text(text),
    color: Theme.of(context).accentColor,
  );
}
