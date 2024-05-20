part of '../sign_in_page.dart';

class _BuildSocialNetworkSign extends StatelessWidget {
  const _BuildSocialNetworkSign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: CustomElevatedButton(
            onTap: () {
              showToast(
                  msg: AppLocalizations.of(context)!.google_sign_in_clicked);
            },
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.google,
                  height: 25,
                ),
                const SizedBox(width: Const.space15),
                Text(
                  'Google',
                  style: _theme.textTheme.bodyText2?.copyWith(
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: Const.margin),
        Expanded(
          child: CustomElevatedButton(
            onTap: () {
              showToast(
                  msg: AppLocalizations.of(context)!.facebook_sign_in_clicked);
            },
            color: const Color(0xFF3b5998),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.facebook,
                  color: Colors.white,
                  height: 25,
                ),
                const SizedBox(width: Const.space15),
                Text(
                  'Facebook',
                  style: _theme.textTheme.bodyText2?.copyWith(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
