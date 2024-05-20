part of '../discover_page.dart';

class _FilterDialog extends StatefulWidget {
  @override
  __FilterDialogState createState() => __FilterDialogState();
}

class __FilterDialogState extends State<_FilterDialog> {
  String dropdownValue = 'Recommended';
  int? _materialIndex;
  int? _categoryIndex;
  int? _colorIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(Const.radius),
          topRight: Radius.circular(Const.radius),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Const.margin,
        vertical: Const.space12,
      ),
      child: Stack(
        children: [
          ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              AutoSizeText(
                AppLocalizations.of(context)!.sort_by,
                style: theme.textTheme.headline3,
              ),
              const SizedBox(height: Const.space12),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  elevation: 16,
                  style: theme.textTheme.subtitle1,
                  isExpanded: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: FilterList.sortByList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: theme.textTheme.bodyText2),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: Const.space15),
              AutoSizeText(
                AppLocalizations.of(context)!.material,
                style: theme.textTheme.headline3,
              ),
              const SizedBox(height: Const.space12),
              Wrap(
                children: FilterList.materialList.asMap().entries.map((e) {
                  final _index = e.key;
                  final _val = e.value;
                  return Padding(
                    padding: const EdgeInsets.only(
                        right: Const.space12, bottom: Const.space12),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _materialIndex = _index;
                        });
                      },
                      borderRadius: BorderRadius.circular(Const.radius),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Const.space12, vertical: Const.space8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Const.radius),
                          border: Border.all(
                              color: (_materialIndex == _index)
                                  ? theme.primaryColor
                                  : theme.hintColor),
                          color: (_materialIndex == _index)
                              ? theme.primaryColor
                              : theme.cardColor,
                        ),
                        child: AutoSizeText(
                          _val,
                          style: theme.textTheme.headline3!.copyWith(
                            color: (_materialIndex == _index)
                                ? Colors.white
                                : null,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: Const.space15),
              AutoSizeText(
                AppLocalizations.of(context)!.categories,
                style: theme.textTheme.headline3,
              ),
              const SizedBox(height: Const.space12),
              Wrap(
                children: CategoryList.categoryList.asMap().entries.map((e) {
                  final _index = e.key;
                  final _val = e.value.name!;
                  return Padding(
                    padding: const EdgeInsets.only(
                        right: Const.space12, bottom: Const.space12),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _categoryIndex = _index;
                        });
                      },
                      borderRadius: BorderRadius.circular(Const.radius),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Const.space12, vertical: Const.space8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Const.radius),
                          border: Border.all(
                              color: (_categoryIndex == _index)
                                  ? theme.primaryColor
                                  : theme.hintColor),
                          color: (_categoryIndex == _index)
                              ? theme.primaryColor
                              : theme.cardColor,
                        ),
                        child: AutoSizeText(
                          _val,
                          style: theme.textTheme.headline3!.copyWith(
                            color: (_categoryIndex == _index)
                                ? Colors.white
                                : null,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: Const.space15),
              AutoSizeText(
                AppLocalizations.of(context)!.colors,
                style: theme.textTheme.headline3,
              ),
              const SizedBox(height: Const.space12),
              Wrap(
                children: FilterList.colorList.asMap().entries.map((e) {
                  final _index = e.key;
                  final _val = e.value;
                  return Padding(
                    padding: const EdgeInsets.only(
                        right: Const.space12, bottom: Const.space12),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            _colorIndex = _index;
                          });
                        },
                        borderRadius: BorderRadius.circular(Const.radius),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: _val,
                          child: (_colorIndex == _index)
                              ? const CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.white,
                                )
                              : const SizedBox(),
                        )),
                  );
                }).toList(),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              color: theme.backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    AppLocalizations.of(context)!.filter,
                    style: theme.textTheme.headline3,
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(Const.space25),
                    child: const Icon(
                      Icons.close,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
