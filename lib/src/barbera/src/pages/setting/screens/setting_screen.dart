part of '../setting_page.dart';

class BarberaSettingScreen extends StatefulWidget {
  const BarberaSettingScreen({Key? key}) : super(key: key);

  @override
  _BarberaSettingScreenState createState() => _BarberaSettingScreenState();
}

class _BarberaSettingScreenState extends State<BarberaSettingScreen> {
  bool _notification = false;
  bool _call = false;
  bool _location = false;
  bool _vibrate = false;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: AppLocalizations.of(context)!.settings,
      ),
      body: ListView(
        children: [
          const SizedBox(height: Const.space15),
          Container(
            width: Screens.width(context),
            height: 50,
            color: _theme.cardColor,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: Text(AppLocalizations.of(context)!.settings,
                style: _theme.textTheme.headline4),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.notification,
                    style: _theme.textTheme.bodyText2),
                Switch(
                  value: _notification,
                  activeColor: _theme.primaryColor,
                  onChanged: (value) {
                    setState(() {
                      _notification = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.call,
                  style: _theme.textTheme.bodyText2,
                ),
                Switch(
                  value: _call,
                  activeColor: _theme.primaryColor,
                  onChanged: (value) {
                    setState(() {
                      _call = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.location,
                  style: _theme.textTheme.bodyText2,
                ),
                Switch(
                  value: _location,
                  activeColor: _theme.primaryColor,
                  onChanged: (value) {
                    setState(() {
                      _location = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.dark_theme,
                  style: _theme.textTheme.bodyText2,
                ),
                Switch(
                  value: context.watch<ThemeProvider>().isDarkTheme,
                  activeColor: _theme.primaryColor,
                  onChanged: (value) {
                    context.read<ThemeProvider>().changeTheme();
                  },
                ),
              ],
            ),
          ),
          Container(
            width: Screens.width(context),
            height: 50,
            color: _theme.cardColor,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: Text(AppLocalizations.of(context)!.reminder_settings, style: _theme.textTheme.headline4),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.vibrate, style: _theme.textTheme.bodyText2),
                Switch(
                  value: _vibrate,
                  activeColor: _theme.primaryColor,
                  onChanged: (value) {
                    setState(() {
                      _vibrate = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: Const.space15),
          Center(
            child: Text(
              'Ver: 2.2.5',
              style: _theme.textTheme.subtitle2,
            ),
          )
        ],
      ),
    );
  }
}
