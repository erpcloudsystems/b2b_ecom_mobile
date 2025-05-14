import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class FiltersByItemGroupWidget extends StatefulWidget {
  const FiltersByItemGroupWidget({super.key});

  @override
  State<FiltersByItemGroupWidget> createState() =>
      _FiltersByItemGroupWidgetState();
}

class _FiltersByItemGroupWidgetState extends State<FiltersByItemGroupWidget> {
  final parentListTest = [
    // Change Arabic
    'الكل',
    'سانتيه بوكس',
    'سانتيه بوكس',
    'سانتيه بوكس',
    'سانتيه بوكس',
  ];
  String parentSelectedItem = 'الكل';
  String childSelectedItem = 'الكل';

  final childListTest = [
    'الكل',
    'سانتيه بوكس',
    'سانتيه بوكس',
    'سانتيه بوكس',
    'سانتيه بوكس',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 43,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: parentListTest.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ColorsManager.grey.withAlpha(20),
                    borderRadius: BorderRadius.circular(12),
                    border: parentSelectedItem == parentListTest[index]
                        ? Border.all(color: ColorsManager.mainColor)
                        : null,
                  ),
                  child: Text(
                    parentListTest[index],
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: childSelectedItem == childListTest[index]
                              ? ColorsManager.mainColor
                              : ColorsManager.grey,
                        ),
                  ),
                );
              },
            ),
          ),
          const Gutter(),
          SizedBox(
            height: 43,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: childListTest.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    childListTest[index],
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: childSelectedItem == childListTest[index]
                              ? ColorsManager.mainColor
                              : ColorsManager.grey,
                        ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
