import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SkeletonContainer extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Color color;

  SkeletonContainer._({
    this.width = double.infinity,
    this.height = double.infinity,
    this.borderRadius = double.infinity,
    this.color,
    Key key,
  });

  SkeletonContainer.square({
    double width,
    double height,
    double borderRadius,
    Color color,
  }) : this._(
            width: width,
            height: height,
            borderRadius: borderRadius,
            color: color);
  @override
  _SkeletonContainerState createState() => _SkeletonContainerState();
}

class _SkeletonContainerState extends State<SkeletonContainer> {
  @override
  Widget build(BuildContext context) {
    return SkeletonAnimation(
      curve: Curves.linear,
      gradientColor: Color.fromRGBO(255, 255, 255, 0.08),
      shimmerColor: Color.fromRGBO(255, 255, 255, 0.08),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
      ),
    );
  }
}
