part of '../search_page.dart';

class BelilaSearchAllProductScreen extends SearchDelegate<dynamic> {
  bool builtSuggestionsForTheFirstTime = false;

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: theme.cardColor,
        titleTextStyle: theme.textTheme.bodyText2,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
      textTheme: TextTheme(headline6: theme.textTheme.bodyText2),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        color: Theme.of(context).primaryColor,
        icon: const Icon(Icons.search),
        onPressed: () {
          showResults(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      color: Theme.of(context).primaryColor,
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final _products = popularProductList.map((e) => e).toList();
    final _result = query.isEmpty
        ? _products
            .where((element) => element.name!.toLowerCase().startsWith(query))
            .toList()
        : _products
            .where((element) => element.name!.toLowerCase().startsWith(query))
            .toList();
    return _ResultProduct(productList: _result);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final _products = popularProductList.map((e) => e).toList();
    final _result = query.isEmpty
        ? _products
            .where((element) => element.name!.toLowerCase().startsWith(query))
            .toList()
        : _products
            .where((element) => element.name!.toLowerCase().startsWith(query))
            .toList();

    return _SuggestionProduct(productList: _result);
  }
}
