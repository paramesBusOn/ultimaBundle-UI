part of '../language_page.dart';

class BarberaLanguageScreen extends StatelessWidget {
  const BarberaLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    Text _title(String val) {
      switch (val) {
        case 'en':
          return Text('English', style: _theme.textTheme.bodyText2);
        case 'id':
          return Text('Bahasa Indonesia', style: _theme.textTheme.bodyText2);
        default:
          return Text('English', style: _theme.textTheme.bodyText2);
      }
    }

    return Consumer<LocaleProvider>(builder: (context, locale, snapshot) {
      final lang = locale.locale ?? Localizations.localeOf(context);
      return Scaffold(
        appBar: CustomAppBar(
          context,
          title: AppLocalizations.of(context)!.language,
          actions: [
            IconButton(
              onPressed: () {},
              color: _theme.primaryColor,
              icon: const Icon(FeatherIcons.check),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Const.margin),
          child: Column(
            children: [
              const SizedBox(height: Const.space25),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.language,
                    height: 25,
                  ),
                  const SizedBox(width: Const.space12),
                  Text(
                    AppLocalizations.of(context)!.available_languages,
                    style: _theme.textTheme.headline3,
                  )
                ],
              ),
              const SizedBox(height: Const.space15),
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Const.radius),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Const.space8),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<Locale>(
                      value: lang,
                      elevation: 16,
                      dropdownColor: _theme.cardColor,
                      isExpanded: true,
                      style: _theme.textTheme.bodyText2,
                      onChanged: (Locale? newValue) {
                        locale.setLocale(newValue!);
                      },
                      items: L10n.all.map((Locale v) {
                        return DropdownMenuItem(
                          value: v,
                          child: _title(v.languageCode),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
