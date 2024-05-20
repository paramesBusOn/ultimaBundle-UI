part of '../track_delivery_page.dart';

class TrackDeliveryArgsModel {
  final int? orderId;
  final String? status;

  TrackDeliveryArgsModel({
    this.orderId,
    this.status,
  });
}

class BelilaTrackDeliveryScreen extends StatefulWidget {
  const BelilaTrackDeliveryScreen({Key? key}) : super(key: key);

  @override
  _BelilaTrackDeliveryScreenState createState() => _BelilaTrackDeliveryScreenState();
}

class _BelilaTrackDeliveryScreenState extends State<BelilaTrackDeliveryScreen> {
  late TrackDeliveryArgsModel _track;
  final String _status = 'success';
  @override
  void initState() {
    super.initState();
    _track = Get.arguments as TrackDeliveryArgsModel;
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    Color _packagingColor(String val) {
      switch (val) {
        case 'packaging':
          return _theme.primaryColor;
        case 'on_delivery':
          return _theme.primaryColor;
        case 'success':
          return _theme.primaryColor;
        default:
          return _theme.disabledColor;
      }
    }

    Color _onDeliveryColor(String val) {
      switch (val) {
        case 'on_delivery':
          return _theme.primaryColor;
        case 'success':
          return _theme.primaryColor;
        default:
          return _theme.disabledColor;
      }
    }

    Color _doneColor(String val) {
      switch (val) {
        case 'success':
          return _theme.primaryColor;
        default:
          return _theme.disabledColor;
      }
    }

    String _statusLabel(String val) {
      switch (val) {
        case 'process':
          return AppLocalizations.of(context)!.waiting_for_payment;
        case 'packaging':
          return AppLocalizations.of(context)!.packed_by_seller;
        case 'on_delivery':
          return AppLocalizations.of(context)!.on_delivery;
        case 'success':
          return AppLocalizations.of(context)!.done;
        default:
          return AppLocalizations.of(context)!.on_delivery;
      }
    }

    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: AppLocalizations.of(context)!.track_delivery,
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 140,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 130,
                  child: Row(
                    children: [
                      Expanded(
                        child: TimelineTile(
                          isFirst: true,
                          afterLineStyle: LineStyle(color: _theme.primaryColor),
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.center,
                          indicatorStyle: IndicatorStyle(
                            color: _theme.primaryColor,
                          ),
                          startChild: CircleAvatar(
                            radius: 20,
                            backgroundColor: _theme.primaryColor,
                            child: const Icon(
                              FeatherIcons.creditCard,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                          endChild: const SizedBox(),
                        ),
                      ),
                      Expanded(
                        child: TimelineTile(
                          afterLineStyle: LineStyle(
                            color: _packagingColor(_status),
                          ),
                          beforeLineStyle: LineStyle(
                            color: _packagingColor(_status),
                          ),
                          indicatorStyle: IndicatorStyle(
                            color: _packagingColor(_status),
                          ),
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.center,
                          startChild: CircleAvatar(
                            radius: 20,
                            backgroundColor: _packagingColor(_status),
                            child: const Icon(
                              FeatherIcons.gift,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                          endChild: const SizedBox(),
                        ),
                      ),
                      Expanded(
                        child: TimelineTile(
                          afterLineStyle: LineStyle(
                            color: _onDeliveryColor(_status),
                          ),
                          beforeLineStyle: LineStyle(
                            color: _onDeliveryColor(_status),
                          ),
                          indicatorStyle: IndicatorStyle(
                            color: _onDeliveryColor(_status),
                          ),
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.center,
                          startChild: CircleAvatar(
                            radius: 20,
                            backgroundColor: _onDeliveryColor(_status),
                            child: const Icon(
                              FeatherIcons.truck,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                          endChild: const SizedBox(),
                        ),
                      ),
                      Expanded(
                        child: TimelineTile(
                          afterLineStyle: LineStyle(
                            color: _doneColor(_track.status ?? ''),
                          ),
                          beforeLineStyle: LineStyle(
                            color: _doneColor(_track.status ?? ''),
                          ),
                          indicatorStyle: IndicatorStyle(
                            color: _doneColor(_track.status ?? ''),
                          ),
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.center,
                          isLast: true,
                          startChild: CircleAvatar(
                            radius: 20,
                            backgroundColor: _doneColor(_track.status ?? ''),
                            child: const Icon(
                              FeatherIcons.check,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                          endChild: const SizedBox(),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 18,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      _statusLabel(_track.status ?? 'on_delivery'),
                      style: GoogleFonts.dmSans(
                        fontSize: 18,
                        color: _theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(color: _theme.disabledColor),
          const SizedBox(height: 25),
          _BuildTrackingList(
            orderId: _track.orderId ?? 0,
          ),
        ],
      ),
    );
  }
}
