import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedUOMProvider = StateProvider<String>((ref) {
  return 'Piece';
});

class CustomChoiceChip extends ConsumerStatefulWidget {
  const CustomChoiceChip({super.key, required this.values});

  final List<String> values;

  @override
  CustomChoiceChipState createState() => CustomChoiceChipState();
}

class CustomChoiceChipState extends ConsumerState<CustomChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: widget.values.map((String value) {
        return ChoiceChip(
          label: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: value == ref.watch(selectedUOMProvider)
                      ? Colors.white
                      : Colors.black,
                ),
          ),
          selected: ref.watch(selectedUOMProvider) == value,
          onSelected: (bool selected) {
            ref.read(selectedUOMProvider.notifier).state =
                selected ? value : '';
          },
          backgroundColor: ColorsManager.grey,
          selectedColor: ColorsManager.mainColor,
          checkmarkColor: value == ref.watch(selectedUOMProvider)
              ? Colors.white
              : Colors.black,
        );
      }).toList(),
    );
  }
}
