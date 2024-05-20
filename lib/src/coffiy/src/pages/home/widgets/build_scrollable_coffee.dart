part of '../home_page.dart';



class _BuildScrollableCoffee extends StatelessWidget {
  const _BuildScrollableCoffee({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Expanded(
      child: Container(
        width: Screens.width(context),
        decoration: BoxDecoration(
          color: _theme.primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(Const.radius),
            topRight: Radius.circular(Const.radius),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: Const.space15),
            Text(
              AppLocalizations.of(context)!.choose_your_coffee,
              style: _theme.textTheme.bodyText1?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: Const.space15),
            Expanded(
              child: ListView.builder(
                itemCount: coffeeList.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: Const.margin,
                ),
                itemBuilder: (context, index) {
                  final _coffee = coffeeList[index];
                  return _CoffeeCard(coffee: _coffee);
                },
              ),
            ),
            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
