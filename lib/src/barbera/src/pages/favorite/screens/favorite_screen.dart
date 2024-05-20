part of '../favorite_page.dart';

class BarberaFavoriteScreen extends StatelessWidget {
  const BarberaFavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          context,
          title: AppLocalizations.of(context)!.favorite_barbers_salon,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              height: 45,
              width: Screens.width(context),
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: _theme.primaryColor),
              ),
              child: TabBar(
                labelStyle: _theme.textTheme.subtitle2
                    ?.copyWith(color: _theme.primaryColor),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: _theme.primaryColor),
                  color: _theme.primaryColor,
                ),
                labelColor: _theme.backgroundColor,
                unselectedLabelColor: _theme.primaryColor,
                tabs: [
                  Tab(text: AppLocalizations.of(context)!.barber),
                  Tab(text: AppLocalizations.of(context)!.barbershop),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            _BuildBarberTab(),
            _BuildBarbershopTab(),
          ],
        ),
      ),
    );
  }
}
