import 'package:flutter/material.dart';
import 'package:fungji/layouts/skeleton_container.dart';

class Skeleton {
  Widget musicThumbnailImage() {
    return SkeletonContainer.square(
      width: 160,
      height: 100,
      borderRadius: 0,
      color: Color.fromRGBO(0, 0, 0, 0.6),
    );
  }

  Widget sysMusicListThumbnailImage() {
    return SkeletonContainer.square(
      width: 300,
      height: 200,
      borderRadius: 0,
      color: Color.fromRGBO(0, 0, 0, 0.6),
    );
  }

  Widget profileImage() {
    return SkeletonContainer.square(
      width: 80,
      height: 80,
      borderRadius: 40,
      color: Color.fromRGBO(0, 0, 0, 0.6),
    );
  }
}
