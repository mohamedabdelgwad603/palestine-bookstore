import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';
import '../services/admob_service/AdsManger.dart';
import '../widgets/drawer_widget.dart';
import 'pdf_screen.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  AdmobBannerSize? bannerSize;
  AdmobInterstitial? interstitialAd;

  @override
  void initState() {
    super.initState();

    //Ads
    interstitialAd = AdmobInterstitial(
      adUnitId: AdsManager.interstitialAdUnitId,
      listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
        if (event == AdmobAdEvent.closed) interstitialAd?.load();
      },
    );

    interstitialAd?.load();
  }

  @override
  void dispose() {
    interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawerScreen(),
        appBar: AppBar(
          centerTitle: true,
          title: Text("كتب عن القضية الفلسطينية"),
        ),
        body: Stack(children: [
          GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 130,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: pdf_list.length,
            itemBuilder: (ctx, index) => InkWell(
              onTap: () {
                interstitialAd?.show();
                Navigator.of(ctx).push(MaterialPageRoute(
                    builder: (_) => pdfScreen(
                          pdfUrl: pdf_list[index].url,
                          title: pdf_list[index].title,
                        )));
              },
              child: Container(
                child: Image.asset(
                  pdf_list[index].src,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: AdmobBanner(
                adUnitId: AdsManager.bannerAdUnitId,
                adSize: AdmobBannerSize.SMART_BANNER(context),
              )),
        ]));
  }
}
