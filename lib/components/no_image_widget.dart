import 'package:flutter/material.dart';

class NoImageWidget extends StatelessWidget {
  final BoxFit fit;
  NoImageWidget({this.fit});
  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: const EdgeInsets.all(8),
        child: Image.asset('',
      fit: fit ?? BoxFit.contain,
    ));
  }
}
