import 'package:flutter/material.dart';

import '../../../core/widgets/header.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHeader(context, appTitle: true),
      body: Container(
        child: Center(
          child: Text("Overview"),
        ),
      ),
    );
  }
}
