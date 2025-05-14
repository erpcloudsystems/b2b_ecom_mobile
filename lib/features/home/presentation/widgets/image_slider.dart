import 'package:carousel_slider/carousel_slider.dart' as slider;
import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/cached_image.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    super.key,
    required this.images,
    this.isAutoSliding = true,
    this.viewPort = 0.8,
    this.description,
    this.isLocal = false,
  });
  final List<String?> images;
  final bool isAutoSliding;
  final double viewPort;
  final List<String?>? description;
  final bool isLocal;
  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int current = 0;
  final controller = slider.CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.images.isNotEmpty)
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              slider.CarouselSlider.builder(
                options: slider.CarouselOptions(
                  autoPlay: widget.isAutoSliding,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  viewportFraction: widget.viewPort,
                  aspectRatio: 256 / 128,
                  onPageChanged: (index, reason) {
                    setState(() {
                      current = index;
                    });
                  },
                ),
                itemCount: widget.images.length,
                itemBuilder: (ctx, index, _) => ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: widget.isLocal
                      ? Image.asset(
                          widget.images[index]!,
                          fit: BoxFit.cover,
                        )
                      : CachedImage(
                          imageUrl: widget.images[index]!,
                          width: double.infinity,
                        ),
                ),
                carouselController: controller,
              ),
              if (widget.description != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    widget.description![current]!,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: ColorsManager.mainColor),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        if (widget.images.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.images.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => controller.animateToPage(entry.key),
                child: Container(
                  width: 20.w,
                  height: 4.h,
                  margin: EdgeInsets.symmetric(
                    vertical: 8.0.h,
                    horizontal: 4.0.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorsManager.secondaryColor
                        .withOpacity(current == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}
