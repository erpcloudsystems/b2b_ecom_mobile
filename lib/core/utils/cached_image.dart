import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double? iconSize;
  final bool isAssignedImage;
  final String? userName;
  const CachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.iconSize,
    this.isAssignedImage = false,
    this.userName,
  });

  @override
  Widget build(BuildContext context) {
    // final globalVariables = GlobalVariables();
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      width: width,
      height: height,
      placeholder: (context, url) {
        return Skeletonizer(
          enabled: true,
          child: SizedBox(
            width: width,
            height: height,
            child: Container(
              color: Colors.grey.withOpacity(.5),
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return isAssignedImage
            ? CircleAvatar(
                radius: 25,
                child: Text(userName!),
              )
            : SizedBox(
                width: width,
                height: height,
                child: Container(
                  color: Colors.grey.withOpacity(.5),
                  child: Icon(
                    Icons.error,
                    size: iconSize,
                  ),
                ),
              );
      },
    );
  }
}
