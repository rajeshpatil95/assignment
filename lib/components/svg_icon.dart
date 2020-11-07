import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIconWidget extends StatelessWidget {
  final String path;
  final Color color;
  final double height;
  final double width;
  final package;
  SvgIconWidget(this.path, {this.color, this.height, this.width, this.package})
      : assert(path != null);
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      color: color ?? Theme.of(context).primaryColor,
      height: height ?? 24,
      width: width ?? 24,
      package: package,
    );
  }
}