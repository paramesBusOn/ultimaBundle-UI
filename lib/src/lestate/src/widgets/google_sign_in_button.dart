import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ultimate_bundle/src/lestate/src/helpers/colors.dart';
import 'package:ultimate_bundle/src/lestate/src/helpers/constants.dart';
import 'package:ultimate_bundle/src/lestate/src/widgets/custom_elevated_button.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    Key? key,
  }) :  super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    
    return CustomElevatedButton(
      onTap: () {},
      color: Colors.white,
      child: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.sign_in_with_google,
                style: _theme.textTheme.bodyText2?.copyWith(
                  color: ColorLight.fontTitle,
                ),
              ),
            ),
          ),
          Positioned(
            left: Const.margin,
            top: 0,
            bottom: 0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(
                CustomIcons.google,
                width: 25,
              ),
            ),
          )
        ],
      ),
    );
  }
}
