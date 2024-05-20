import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_bundle/helpers/constants.dart';
import 'package:ultimate_bundle/providers/theme_provider.dart';
import 'package:ultimate_bundle/src/shuppy/src/helpers/constants.dart';
import 'package:ultimate_bundle/src/shuppy/src/helpers/screens.dart';

class ShuppySplashScreen extends StatefulWidget {
  const ShuppySplashScreen({Key? key}) : super(key: key);

  @override
  _ShuppySplashScreenState createState() => _ShuppySplashScreenState();
}

class _ShuppySplashScreenState extends State<ShuppySplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.toNamed<dynamic>(ShuppyRoutes.onBoarding),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: Image.asset(
          (_theme.isDarkTheme) ? Images.logoDark : Images.logoLight,
          width: Screens.width(context) / 2,
          height: Screens.width(context) / 2,
        ),
      ),
    );
  }
}
