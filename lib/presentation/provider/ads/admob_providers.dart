import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:miscelaneos/config/config.dart';
import 'package:miscelaneos/presentation/provider/providers.dart';

final adBannerProvider = FutureProvider<BannerAd>((ref) async {
  final showAds = ref.watch(showsAdsProvider);
  if (!showAds) throw 'Ads Bloqueadas';
  final ad = await AdmobPlugin.loadBannerAd();
  return ad;
});

final adInterstitialProvider =
    FutureProvider.autoDispose<InterstitialAd>((ref) async {
  final showAds = ref.watch(showsAdsProvider);
  if (!showAds) throw 'Ads Bloqueadas';
  final ad = await AdmobPlugin.loadInterstitialAd();
  return ad;
});

final adRewardedProvider = FutureProvider.autoDispose<RewardedAd>((ref) async {
  final showAds = ref.watch(showsAdsProvider);
  if (!showAds) throw 'Ads Bloqueadas';
  final ad = await AdmobPlugin.loadRewardedAd();
  return ad;
});
