import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:ultimate_bundle/helpers/routes.dart';
import 'package:ultimate_bundle/helpers/themes.dart';
import 'package:ultimate_bundle/helpers/uikit_model.dart';
import 'package:ultimate_bundle/l10n/l10n.dart';
import 'package:ultimate_bundle/providers/locale_provider.dart';
import 'package:ultimate_bundle/providers/theme_provider.dart';
import 'package:ultimate_bundle/settings.dart';
part 'tabbar/uikit_tabbar.dart';
part 'tabbar/on_boarding_tabbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer2<LocaleProvider, ThemeProvider>(
        builder: (context, _locale, _theme, snapshot) {
          return GetMaterialApp(
            title: 'Flutima',
            debugShowCheckedModeBanner: false,
            theme: themeLight(context),
            darkTheme: themeDark(context),
            themeMode:
                (_theme.isDarkTheme == true) ? ThemeMode.dark : ThemeMode.light,
            supportedLocales: L10n.all,
            getPages: allRoutesFurney,
            locale: _locale.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: const _DashboardScreen(),
          );
        },
      ),
    );
  }
}

class _DashboardScreen extends StatelessWidget {
  const _DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Ultimate Bundle Kit',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () => Get.to<dynamic>(()=> const SettingsScreen()),
              icon: const Icon(Icons.settings),
              color: Colors.white,
            ),
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Full UI Kit'),
              Tab(text: 'On Boarding'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _UIKitTabBar(),
            _OnBoardingTabBar(),
          ],
        ),
      ),
    );
  }
}
