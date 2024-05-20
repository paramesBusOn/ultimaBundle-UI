part of '../filter_page.dart';

class _BuildRatingFilter extends StatefulWidget {

  const _BuildRatingFilter({Key? key}) : super(key: key);
  @override
  __BuildRatingFilterState createState() => __BuildRatingFilterState();
}

class __BuildRatingFilterState extends State<_BuildRatingFilter> {
  double _rating = 0;
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.rating,
            style: _theme.textTheme.headline3,
          ),
          const SizedBox(height: Const.space12),
          Row(
            children: [
              CustomRating(
                score: 1,
                onRating: (v) {
                  setState(() {
                    _rating = v;
                  });
                },
                star: Star(
                  emptyColor: _theme.disabledColor,
                  fillColor: _theme.primaryColor,
                ),
              ),
              const SizedBox(width: Const.space8),
              Text(
                '${_rating.toInt()}${'.0 ${AppLocalizations.of(context)!.star}'}',
                style: _theme.textTheme.subtitle1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
