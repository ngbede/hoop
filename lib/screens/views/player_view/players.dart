import 'package:flutter/material.dart';
import 'package:hoop/components/teams.dart';

class Players extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: teams(context),
    );
  }
}
