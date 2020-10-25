import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedLogo extends StatelessWidget {
  final String url;
  CachedLogo({this.url});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
      radius: 40,
      backgroundColor: Colors.transparent,
    );
  }
}
