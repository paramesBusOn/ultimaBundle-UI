part of '../product_page.dart';


class _BuildDescription extends StatelessWidget {
  const _BuildDescription({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            AppLocalizations.of(context)!.description,
            style: theme.textTheme.headline3,
          ),
          const SizedBox(height: Const.space8),
          AutoSizeText(
            product.description!,
            style: theme.textTheme.subtitle1,
          ),
          const SizedBox(height: Const.space15),
          Row(
            children: [
              SizedBox(
                width: Screens.width(context) / 4,
                child: AutoSizeText(
                  AppLocalizations.of(context)!.categories,
                  style: theme.textTheme.bodyText2,
                ),
              ),
              Text(
                ':',
                style: theme.textTheme.bodyText2,
              ),
              const Spacer(),
              Center(child: Text(product.categories!.join(', ')))
            ],
          ),
          const SizedBox(height: Const.space12),
          Row(
            children: [
              SizedBox(
                width: Screens.width(context) / 4,
                child: AutoSizeText(
                  AppLocalizations.of(context)!.tags,
                  style: theme.textTheme.bodyText2,
                ),
              ),
              Text(
                ':',
                style: theme.textTheme.bodyText2,
              ),
             const Spacer(),
              Center(child: Text(product.tags!.join(', ')))
            ],
          ),
        ],
      ),
    );
  }
}
