import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ultimate_bundle/helpers/constants.dart';
import 'package:ultimate_bundle/src/treshop/src/helpers/constants.dart';

class TreshopSplashScreen extends StatefulWidget {
  const TreshopSplashScreen({Key? key}) : super(key: key);
  @override
  _TreshopSplashScreenState createState() => _TreshopSplashScreenState();
}

class _TreshopSplashScreenState extends State<TreshopSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAllNamed<dynamic>(TreshopRoutes.onBoarding),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          CustomIcon.logo,
        ),
      ),
    );
  }
}
