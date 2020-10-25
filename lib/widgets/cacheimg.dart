import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedLogo extends StatelessWidget {
  final String url;
  final double radius;
  CachedLogo({this.url, this.radius});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
      radius: radius,
      backgroundColor: Colors.transparent,
    );
  }
}
