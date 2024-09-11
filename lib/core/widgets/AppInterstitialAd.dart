
// class Appinterstitialad extends StatefulWidget {
//   const Appinterstitialad({super.key});

//   @override
//   State<Appinterstitialad> createState() => _AppinterstitialadState();
// }

// class _AppinterstitialadState extends State<Appinterstitialad> {
//   @override
//     BannerAd? _bannerAd;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 50,
//       child: FutureBuilder(
//         builder: (context, snapshot) {
//           if (_bannerAd != null) {
//             return AdWidget(ad: _bannerAd!);
//           }
//           return const SizedBox.shrink();
//         },
//         future: _getInterstialAd(),
//       ),
//     );
//   }

//   Future<void> _getInterstialAd() async {
//     await MobileAds.instance.initialize();

//     await InterstitialAd.(
//       adUnitId: "ca-app-pub-3940256099942544/9214589741",
//       // : "ca-app-pub-9997471825373924/1562941916",
//       request: const AdRequest(),
//       size: AdSize.banner,
//       listener: BannerAdListener(
//         onAdLoaded: (ad) {
//           setState(() {
//             _bannerAd = ad as BannerAd;
//           });
//         },
//         onAdFailedToLoad: (ad, err) {
//           print('Failed to load a banner ad: ${err.message}');
//           ad.dispose();
//         },
//       ),
//     ).load();
//   }
// }