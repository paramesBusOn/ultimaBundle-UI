part of '../setting_page.dart';

class _BuildSecurity extends StatefulWidget {
  const _BuildSecurity({Key? key}) : super(key: key);

  @override
  __BuildSecurityState createState() => __BuildSecurityState();
}

class __BuildSecurityState extends State<_BuildSecurity> {
  bool _active2FVerification = true;
  bool _activeBackup = false;
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.security,
            style: _theme.textTheme.headline3,
          ),
          const SizedBox(height: Const.space15),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Const.radius),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: Const.space15),
              child: Column(
                children: [
                  _BuildSwitchTile(
                    value: _active2FVerification,
                    label:
                        AppLocalizations.of(context)!.two_factor_verification,
                    onChanged: (v) {
                      setState(() => _active2FVerification = v);
                    },
                  ),
                  Divider(color: _theme.primaryColor),
                  _BuildSwitchTile(
                    value: _activeBackup,
                    label: AppLocalizations.of(context)!.backup,
                    onChanged: (v) {
                      setState(() => _activeBackup = v);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
