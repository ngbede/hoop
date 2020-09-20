import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:hoop/api/network.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/layout.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final Network net = Network();

  void getFile() async {
    try {
      var json = await net.jsonFile(standingsUrl);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Layout(),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.tealAccent,
        // appBar: AppBar(
        //   backgroundColor: Color(0xFF2372A3),
        //   title: Center(
        //     child: Text(
        //       'HOOP',
        //     ),
        //   ),
        // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingFlipping.circle(size: 100),
            SizedBox(
              height: 20,
            ),
            Text(
              'Grabbing Latest Data',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ));
  }
}
