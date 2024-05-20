part of '../barbershop_page.dart';

class BarberaBarbershopScreen extends StatefulWidget {
  const BarberaBarbershopScreen({Key? key}) : super(key: key);

  @override
  _BarberaBarbershopScreenState createState() => _BarberaBarbershopScreenState();
}

class _BarberaBarbershopScreenState extends State<BarberaBarbershopScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late BarbershopModel _barbershop;
  bool _isBookmarked = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _barbershop = Get.arguments as BarbershopModel;
  }

  VoidCallback? _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  List<Widget> salonTab(BuildContext context) => [
        Tab(text: AppLocalizations.of(context)!.about),
        Tab(text: AppLocalizations.of(context)!.services),
        Tab(text: AppLocalizations.of(context)!.gallery),
        Tab(text: AppLocalizations.of(context)!.review),
      ];

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
      );
    } else {
      await showToast(msg: AppLocalizations.of(context)!.website_not_available);
      // throw 'Could not launch $url';
    }
  }

  Future<void> _launchPhoneCall(String number) async {
    await launch('tel:$number');
    // } else {
  }

  Future<void> _launchShare() async {
    await Share.share('check out my website https://google.com');
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _BuildSliverAppBar(
            isBookmarked: _isBookmarked,
            barbershop: _barbershop,
            onShareTap: _launchShare,
            onBookmarkTap: () {
              setState(() => _isBookmarked = !_isBookmarked);
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: Const.space25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _BuildFeatureTile(
                      icon: FeatherIcons.globe,
                      label: AppLocalizations.of(context)!.website,
                      onTap: () => _launchInBrowser('https://google.com'),
                    ),
                    _BuildFeatureTile(
                      icon: FeatherIcons.phoneCall,
                      label: AppLocalizations.of(context)!.call,
                      onTap: () => _launchPhoneCall('081353020948'),
                    ),
                    _BuildFeatureTile(
                      icon: FeatherIcons.map,
                      label: AppLocalizations.of(context)!.direction,
                      onTap: () {
                        // ignore: todo
                        //TODO: Direction
                      },
                    ),
                    _BuildFeatureTile(
                      icon: FeatherIcons.calendar,
                      label: AppLocalizations.of(context)!.book,
                      onTap: ()=> Get.toNamed<dynamic>(BarberaRoutes.bookingService),
                    ),
                  ],
                ),
                const SizedBox(height: Const.space25),
                const _BuildScrollableBarber(),
                const SizedBox(height: Const.space15),
                TabBar(
                  controller: _tabController,
                  indicatorColor: _theme.primaryColor,
                  labelColor: _theme.primaryColor,
                  unselectedLabelColor: _theme.disabledColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: salonTab(context),
                ),
                Center(
                  child: [
                    const _AboutTabBarView(),
                    const _ServicesTabBarView(),
                    _GalleryTabBarView(barbershop: _barbershop),
                    const _ReviewTabBarView(),
                  ][_tabController.index],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
