import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/provider/providers.dart';

class AdRewardedScreen extends ConsumerWidget {
  const AdRewardedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adRewardedAsync = ref.watch(adRewardedProvider);

    ref.listen(
      adRewardedProvider,
      (previous, next) {
        if (!next.hasValue) return;
        if (next.value == null) return;

        next.value!.show(
          onUserEarnedReward: (ad, reward) {},
        );
      },
    );

    if (adRewardedAsync.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad Rewarded'),
      ),
      body: const Center(
        child: Text('Tienes esta cantidad de puntos XX'),
      ),
    );
  }
}
