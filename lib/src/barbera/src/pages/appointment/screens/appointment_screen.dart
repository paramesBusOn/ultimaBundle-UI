part of '../appointment_page.dart';

class BarberaAppointmentScreen extends StatefulWidget {
  const BarberaAppointmentScreen({Key? key}) : super(key: key);

  @override
  _BarberaAppointmentScreenState createState() => _BarberaAppointmentScreenState();
}

class _BarberaAppointmentScreenState extends State<BarberaAppointmentScreen> {
  bool _isFromProfile = false;

  @override
  void initState() {
    super.initState();
    if (Get.arguments != null) {
      _isFromProfile = Get.arguments as bool;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(
          context,
          title: AppLocalizations.of(context)!.appointment,
          enableLeading: _isFromProfile,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              height: 45,
              width: Screens.width(context),
              margin: const EdgeInsets.symmetric(
                horizontal: Const.margin,
                vertical: Const.space12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Const.space5),
                border: Border.all(color: _theme.primaryColor),
              ),
              child: TabBar(
                labelStyle: _theme.textTheme.subtitle2
                    ?.copyWith(color: _theme.primaryColor),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(Const.space5),
                  border: Border.all(color: _theme.primaryColor),
                  color: _theme.primaryColor,
                ),
                labelColor: _theme.backgroundColor,
                unselectedLabelColor: _theme.primaryColor,
                tabs: [
                  Tab(text: AppLocalizations.of(context)!.upcoming),
                  Tab(text: AppLocalizations.of(context)!.completed),
                  Tab(text: AppLocalizations.of(context)!.cancelled),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _BuildBody(appointmentList: pendingList),
            _BuildBody(appointmentList: completedList),
            _BuildBody(appointmentList: cancelList),
          ],
        ),
      ),
    );
  }
}
