import 'package:flutter/material.dart';
import 'package:hoop/screens/layout.dart';
import 'package:provider/provider.dart';
import 'package:hoop/json/jsons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<JsonFiles>(
      create: (context) => JsonFiles(),
      child: MaterialApp(
        home: Scaffold(
          body: Layout(),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// Stupid changes
// yesterday was a good day