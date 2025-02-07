part of '../on_boarding_page.dart';

class CoffiyOnBoardingScreen extends StatefulWidget {
  const CoffiyOnBoardingScreen({Key? key}) : super(key: key);
  @override
  _CoffiyOnBoardingScreenState createState() => _CoffiyOnBoardingScreenState();
}

class _CoffiyOnBoardingScreenState extends State<CoffiyOnBoardingScreen> {
  int? _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _BodySection(onPageChanged: (v) => setState(() => _currentIndex = v)),
          _BuildDotsIndicator(currentIndex: _currentIndex),
          _BuildStartButton(index: _currentIndex),
          _BuildSkipButton(index: _currentIndex),
        ],
      ),
    );
  }
}
