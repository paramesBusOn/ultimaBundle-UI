part of '../filter_page.dart';

class _BuildSortFilter extends StatefulWidget {
  const _BuildSortFilter({
    Key? key,
  }) : super(key: key);

  @override
  __BuildSortFilterState createState() => __BuildSortFilterState();
}

class __BuildSortFilterState extends State<_BuildSortFilter> {
  late int _selectedIndex = 0;
  List<String> _sortList(BuildContext context) => [
    AppLocalizations.of(context)!.most_popular,
    AppLocalizations.of(context)!.cost_low_to_high,
    AppLocalizations.of(context)!.cost_high_to_low,
  ];

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.sort,
            style: _theme.textTheme.headline3,
          ),
          const SizedBox(height: Const.space12),
          Wrap(
            spacing: Const.space12,
            children:_sortList(context).asMap().entries.map((e) {
              final _index = e.key;
              return InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = _index;
                  });
                },
                borderRadius: BorderRadius.circular(Const.radius),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Const.space12,
                    vertical: Const.space5,
                  ),
                  margin: const EdgeInsets.only(bottom: Const.space12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Const.radius),
                    color: (_selectedIndex == _index)
                        ? _theme.primaryColor
                        : _theme.disabledColor.withOpacity(.2),
                  ),
                  child: Text(
                    e.value,
                    style: _theme.textTheme.bodyText2?.copyWith(
                      color: (_selectedIndex == _index) ? Colors.white : null,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
