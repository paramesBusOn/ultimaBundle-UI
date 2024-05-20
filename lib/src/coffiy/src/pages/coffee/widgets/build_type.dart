part of '../coffee_page.dart';

class _BuildType extends StatefulWidget {
  const _BuildType({
    Key? key,
  }) : super(key: key);

  @override
  State<_BuildType> createState() => _BuildTypeState();
}

class _BuildTypeState extends State<_BuildType> {
  int _selectedType = 0;
  final List<String> _typeList = [
    CustomIcons.hotCoffee,
    CustomIcons.iceCoffee,
  ];
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Text(
            AppLocalizations.of(context)!.type,
            style: _theme.textTheme.bodyText1,
          ),
        ),
        Row(
          children: _typeList
              .asMap()
              .entries
              .map(
                (e) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Const.space12),
                  child: InkWell(
                    onTap: () {
                      setState(() => _selectedType = e.key);
                    },
                    child: SvgPicture.asset(
                      e.value,
                      color: (_selectedType == e.key)
                          ? _theme.primaryColor
                          : _theme.disabledColor,
                    ),
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
