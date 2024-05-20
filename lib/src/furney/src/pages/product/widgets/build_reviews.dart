part of '../product_page.dart';

class _BuildReviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            AppLocalizations.of(context)!.reviews,
            style: theme.textTheme.headline3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AutoSizeText(
                '${0} ${AppLocalizations.of(context)!.reviews}',
                style: theme.textTheme.subtitle2,
              ),
              AutoSizeText.rich(
                TextSpan(children: [
                  TextSpan(
                      text: 0.0.toString(), style: theme.textTheme.headline3),
                  TextSpan(
                      text: ' ${AppLocalizations.of(context)!.out_of} ${5.0}',
                      style: theme.textTheme.bodyText2),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
