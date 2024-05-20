part of '../setting_page.dart';

class _BuildLanguage extends StatefulWidget {
  const _BuildLanguage({Key? key}) : super(key: key);

  @override
  __BuildLanguageState createState() => __BuildLanguageState();
}

class __BuildLanguageState extends State<_BuildLanguage> {
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

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _locale = Provider.of<LocaleProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
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
                children: L10n.all.map((locale) {
                  return RadioListTile(
                    value: locale,
                    contentPadding: EdgeInsets.zero,
                    activeColor: Const.accentColor,
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
            ),
          )
        ],
      ),
    );
  }
}
