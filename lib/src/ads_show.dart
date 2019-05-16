import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';

const appID = 'ca-app-pub-6994561872756029~3010501792';

class AdsToShow extends StatefulWidget{
  @override
  _AdsToShowState createState() => _AdsToShowState();
}

class _AdsToShowState extends State<AdsToShow>{
  static final MobileAdTargetingInfo targetInfo = MobileAdTargetingInfo(
    testDevices:  <String>['U PULSE'],
    keywords: <String>['game','moba','fps','king of glory'],
    childDirected: true,
  );
  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;

  BannerAd createBannerAd(){
    return new BannerAd(
      adUnitId: 'ca-app-pub-6994561872756029/8809623385',
      size: AdSize.banner,
      targetingInfo: targetInfo,
      listener: (MobileAdEvent event){
        print("Banner event: $event");
      }
    );
  }

  InterstitialAd createInterstitialAd(){
    return new InterstitialAd(
        adUnitId: InterstitialAd.testAdUnitId,
        targetingInfo: targetInfo,
        listener: (MobileAdEvent event){
          print("InterstitialAds event: $event");
        }
    );
  }
  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: appID);
    _bannerAd = createBannerAd()..load()..show();
  }

  @override
  void dispose(){
    _bannerAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(color: Colors.transparent,);
  }
}