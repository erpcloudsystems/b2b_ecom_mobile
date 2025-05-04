import 'dart:io';

import 'package:class_a_ec/core/utils/cached_image.dart';
import 'package:flutter/material.dart';

class CustomCircleImage extends StatelessWidget {
  const CustomCircleImage({
    super.key,
    required this.imagePath,
    this.radius,
    this.isLocal = false,
    this.networkImageWidth,
    this.netWorkImageHeight,
    this.isAssignedImage = false,
    this.userName,
  });
  final String imagePath;
  final bool isLocal;
  final double? radius;
  final double? networkImageWidth;
  final double? netWorkImageHeight;
  final bool isAssignedImage;
  final String? userName;

  @override
  Widget build(BuildContext context) {
    return isLocal
        ? CircleAvatar(
            backgroundImage: FileImage(File(imagePath)),
            radius: radius ?? 40,
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(radius ?? 100),
            child: CachedImage(
              imageUrl: imagePath,
              width: networkImageWidth ?? 50,
              height: netWorkImageHeight ?? 50,
              isAssignedImage: isAssignedImage,
              userName: userName,
            ),
          );
  }
}
