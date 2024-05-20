part of '../home_page.dart';

class _BuildScrollableCategory extends StatelessWidget {
  const _BuildScrollableCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Const.margin),
          child: Text(AppLocalizations.of(context)!.categories,
              style: _theme.textTheme.headline3),
        ),
        const SizedBox(height: Const.space12),
        SizedBox(
          width: double.infinity,
          height: 70,
          child: ListView.builder(
            itemCount: categoryList(context).length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            itemBuilder: (context, index) {
              final _category = categoryList(context)[index];

              return _BuildCategoryCard(
                category: _category,
                onTap: () => Get.toNamed<dynamic>(
                  BarberaRoutes.browseBarbershop,
                  arguments: BrowseBarbershopArgument(
                    title: _category.name ?? '',
                    barbershopList: bestBarbershopList,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
