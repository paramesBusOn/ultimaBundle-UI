part of '../home_page.dart';

class _BuildCategoryList extends StatelessWidget {
  final String label;
  final VoidCallback onSeeAllTap;

  const _BuildCategoryList({
    Key? key,
    required this.label,
    required this.onSeeAllTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Const.margin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                label,
                style: Theme.of(context).textTheme.headline3,
              ),
              GestureDetector(
                onTap: onSeeAllTap,
                child: Text(
                  AppLocalizations.of(context)!.see_all,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: Const.space12),
        SizedBox(
          width: double.infinity,
          height: 110,
          child: ListView.builder(
            itemCount: categoryList(context).length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final _category = categoryList(context)[index];
              return _CategoryCircleCard(category: _category);
            },
          ),
        ),
      ],
    );
  }
}
