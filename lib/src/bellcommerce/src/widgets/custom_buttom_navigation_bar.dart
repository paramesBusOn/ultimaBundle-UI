import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ultimate_bundle/src/bellcommerce/src/pages/cart/cart_page.dart';
import 'package:ultimate_bundle/src/bellcommerce/src/pages/favorite/favorite_page.dart';
import 'package:ultimate_bundle/src/bellcommerce/src/pages/home/home_page.dart';
import 'package:ultimate_bundle/src/bellcommerce/src/pages/profile/profile_page.dart';

class BellcommerceBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;

  const BellcommerceBottomNavigationBar({Key? key, this.selectedIndex = 0})
      : super(key: key);
  @override
  BellcommerceBottomNavigationBarState createState() =>
      BellcommerceBottomNavigationBarState();
}

class BellcommerceBottomNavigationBarState
    extends State<BellcommerceBottomNavigationBar> {
  late PageController _controller;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: widget.selectedIndex);
    setState(() {
      _selectedIndex = widget.selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (v) {
          setState(() {
            _selectedIndex = v;
          });
        },
        children: const [
          BellcommerceHomeScreen(),
          BellcommerceCartScreen(),
          BellcommerceFavoriteScreen(),
          BellcommerceProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: _theme.cardColor,
        selectedItemColor: _theme.primaryColor,
        unselectedItemColor: _theme.disabledColor,
        iconSize: 20,
        selectedLabelStyle: _theme.textTheme.bodyText2?.copyWith(
          fontSize: 10,
        ),
        unselectedLabelStyle: _theme.textTheme.subtitle1?.copyWith(
          fontSize: 10,
        ),
        type: BottomNavigationBarType.fixed,
        onTap: (v) {
          setState(() {
            _selectedIndex = v;
            _controller.animateToPage(
              v,
              duration: const Duration(milliseconds: 200),
              curve: Curves.ease,
            );
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(FeatherIcons.home),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(FeatherIcons.shoppingCart),
            label: AppLocalizations.of(context)!.cart,
          ),
          BottomNavigationBarItem(
            icon: const Icon(FeatherIcons.heart),
            label: AppLocalizations.of(context)!.favorite,
          ),
          BottomNavigationBarItem(
            icon: const Icon(FeatherIcons.user),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
    );
  }
}
