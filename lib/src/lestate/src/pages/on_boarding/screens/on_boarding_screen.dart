part of '../on_boarding_page.dart';

class LestateOnBoardingScreen extends StatelessWidget {
  const LestateOnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Const.space25,
            left: 0,
            right: 0,
            bottom: 250,
            child: SvgPicture.asset(
              Illustrations.onBoarding,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Const.margin,
                vertical: Const.space25,
              ),
              decoration: BoxDecoration(
                color: _theme.cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Const.space25),
                  topRight: Radius.circular(Const.space25),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!
                        .find_perfect_place_for_your_dream,
                    style: _theme.textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Const.space25),
                  CustomElevatedButton(
                    onTap: () => Get.toNamed<dynamic>(LestateRoutes.signUp),
                    label: AppLocalizations.of(context)!.sign_up,
                  ),
                  const SizedBox(height: Const.space25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.already_have_an_account,
                        style: _theme.textTheme.subtitle1,
                      ),
                      const SizedBox(width: Const.space5),
                      InkWell(
                        onTap: () => Get.toNamed<dynamic>(LestateRoutes.signIn),
                        child: Text(
                          AppLocalizations.of(context)!.log_in,
                          style: _theme.textTheme.subtitle1?.copyWith(
                            color: Const.accentColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
