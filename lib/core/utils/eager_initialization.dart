import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EagerInitialization extends ConsumerWidget {
  const EagerInitialization({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Eagerly initialize providers by watching them.
    // By using "watch", the provider will stay alive and not be disposed.
    // final result = ref.watch(provider);
    // Handle error states and loading states
    /* if (result.isLoading) {
      return const CustomLoadingWidget();
    } else if (result.hasError) {
      return const Center(
        child: Text(
          StringsManager.defaultErrorMessage,
        ),
      );
    }*/
    return child;
  }
}
