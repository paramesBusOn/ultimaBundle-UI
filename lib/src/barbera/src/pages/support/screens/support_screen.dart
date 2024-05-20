part of '../support_page.dart';

class BarberaSupportScreen extends StatelessWidget {
  const BarberaSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: CustomAppBar(
          context,
          bottom: TabBar(
            indicatorColor: _theme.primaryColor,
            unselectedLabelColor: _theme.disabledColor,
            labelColor: _theme.primaryColor,
            labelStyle: _theme.textTheme.bodyText2,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelStyle: _theme.textTheme.subtitle1,
            isScrollable: true,
            tabs: [
              Tab(text: AppLocalizations.of(context)!.appointment),
              Tab(text: AppLocalizations.of(context)!.services),
              Tab(text: AppLocalizations.of(context)!.delivery),
              Tab(text: AppLocalizations.of(context)!.misc),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _BuildBody(),
            _BuildBody(),
            _BuildBody(),
            _BuildBody(),
          ],
        ),
      ),
    );
  }
}

