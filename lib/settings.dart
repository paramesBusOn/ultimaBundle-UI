import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:launch_review/launch_review.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_bundle/l10n/l10n.dart';
import 'package:ultimate_bundle/providers/locale_provider.dart';
import 'package:ultimate_bundle/providers/theme_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final String _androidAppID = 'com.byneetdev.ultimate_bundle';
  final String _codecanyonUrl =
      'https://codecanyon.net/item/flutter-ecommerce-ui-kit/28404745';
  Locale? _selectedLocale = L10n.all.first;

  @override
  void initState() {
    super.initState();
    switch (Platform.localeName) {
      case 'id_ID':
        _selectedLocale = L10n.all[1];
        break;
      default:
        _selectedLocale = L10n.all.first;
    }
  }

  String _language(String val) {
    switch (val) {
      case 'id':
        return 'Indonesian';
      default:
        return 'English';
    }
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _themeMode = Provider.of<ThemeProvider>(context);
    final _locale = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.settings,
          style: _theme.textTheme.headline3?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: _themeMode.changeTheme,
            title: Text(
              AppLocalizations.of(context)!.dark_mode,
              style: _theme.textTheme.bodyText1,
            ),
            trailing: Switch(
              value: _themeMode.isDarkTheme,
              onChanged: (v) {
                _themeMode.changeTheme();
              },
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {
              LaunchReview.launch(
                androidAppId: _androidAppID,
              );
            },
            title: Text(
              AppLocalizations.of(context)!.rate_the_app,
              style: _theme.textTheme.bodyText1,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () => _launchInBrowser(_codecanyonUrl),
            title: Text(
              AppLocalizations.of(context)!.purchase_this_app,
              style: _theme.textTheme.bodyText1,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            AppLocalizations.of(context)!.change_language,
            style: _theme.textTheme.bodyText1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: L10n.all.map((locale) {
              return RadioListTile(
                value: locale,
                activeColor: _theme.primaryColor,
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        _language(locale.languageCode),
                        style: _theme.textTheme.bodyText2,
                      )
                    ],
                  ),
                ),
                groupValue: _selectedLocale,
                onChanged: (dynamic value) {
                  setState(() {
                    _selectedLocale = locale;
                    _locale.setLocale(locale);
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
