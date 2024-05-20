part of '../filter_page.dart';


class _BuildGenderFilter extends StatefulWidget {
  const _BuildGenderFilter({
    Key? key,
  }) : super(key: key);

  @override
  __BuildGenderFilterState createState() => __BuildGenderFilterState();
}

class __BuildGenderFilterState extends State<_BuildGenderFilter> {
  int _selectedGender = 0;
   List<String> _genderList(BuildContext context) => [
    AppLocalizations.of(context)!.male,
    AppLocalizations.of(context)!.female,
    AppLocalizations.of(context)!.custom,
  ];
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Const.margin),
          child: Text(
            AppLocalizations.of(context)!.gender,
            style: _theme.textTheme.bodyText1,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _genderList(context).asMap()
              .entries
              .map((e) => Row(
                    children: [
                      Radio(
                          value: e.key,
                          groupValue: _selectedGender,
                          focusColor: _theme.primaryColor,
                          activeColor: _theme.primaryColor,
                          hoverColor: _theme.dividerColor,
                          onChanged: (int? value) {
                            setState(() {
                              _selectedGender = value??0;
                            });
                          }),
                      Text(e.value, style: _theme.textTheme.bodyText1),
                    ],
                  ))
              .toList(),
        ),
      ],
    );
  }
}
