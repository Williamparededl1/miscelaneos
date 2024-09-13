import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/provider/providers.dart';

class AdFullScreen extends ConsumerWidget {
  const AdFullScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final interstitialProvider = ref.watch(adInterstitialProvider);
    ref.listen(
      adInterstitialProvider,
      (previous, next) {
        if (!next.hasValue) return;
        if (next.value == null) return;

        next.value!.show();
      },
    );

    if (interstitialProvider.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdFullScreen'),
      ),
      body: const Center(
        child: Text('Ya puedes ver esta Pantalla'),
      ),
    );
  }
}
