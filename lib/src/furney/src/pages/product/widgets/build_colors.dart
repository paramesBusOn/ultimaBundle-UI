part of '../product_page.dart';

class _BuildColors extends StatefulWidget {
  @override
  __BuildColorsState createState() => __BuildColorsState();
}

class __BuildColorsState extends State<_BuildColors> {
  int? _colorIndex;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  right: Const.space12,
                  bottom: Const.space12,
                ),
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
    );
  }
}
