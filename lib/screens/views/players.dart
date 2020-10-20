import 'package:flutter/material.dart';
import 'package:hoop/widgets/teams.dart';
// import 'package:hoop/json/jsons.dart';
// import 'package:provider/provider.dart';

class Players extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: teams(context),
    );
  }
}
