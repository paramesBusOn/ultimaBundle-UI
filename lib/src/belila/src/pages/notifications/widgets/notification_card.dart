part of '../notification_page.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const NotificationCard({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    String _notificationTitle(String? val) {
      switch (val) {
        case 'pending':
          return AppLocalizations.of(context)!.pending;
        case 'waiting':
          return AppLocalizations.of(context)!.waiting;
        case 'process':
          return AppLocalizations.of(context)!.process;
        case 'packaging':
          return AppLocalizations.of(context)!.packaging;
        case 'on_delivery':
          return AppLocalizations.of(context)!.on_delivery;
        case 'success':
          return AppLocalizations.of(context)!.success;
        case 'decline':
          return AppLocalizations.of(context)!.decline;
        case 'cancel':
          return AppLocalizations.of(context)!.cancel;
        default:
          return '';
      }
    }

    String _notificationSubtitle(String? val) {
      switch (val) {
        case 'pending':
          return AppLocalizations.of(context)!.waiting_for_seller_approval;
        case 'waiting':
          return AppLocalizations.of(context)!.is_waiting_for_payment;
        case 'process':
          return AppLocalizations.of(context)!.successfully_confirmed_please_wait_for_the_package_to_be_delivered;
        case 'packaging':
          return AppLocalizations.of(context)!.the_package_is_being_packed_by_the_seller_please_wait_until_the_seller_sends_your_package;
        case 'on_delivery':
          return AppLocalizations.of(context)!.has_been_received_by_the_courier_please_wait_for_the_courier_to_arrive;
        case 'success':
          return AppLocalizations.of(context)!.have_been_completed;
        case 'decline':
          return AppLocalizations.of(context)!.has_been_rejected_by_the_seller;
        case 'cancel':
          return AppLocalizations.of(context)!.has_been_canceled;
        default:
          return '';
      }
    }

    return Slidable(
        actionPane: const SlidableDrawerActionPane(),
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: AppLocalizations.of(context)!.delete,
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {
              showToast(msg: AppLocalizations.of(context)!.notification_deleted);
            },
          ),
        ],
        child: ExpansionTile(
          leading: Container(
            width: 70,
            height: 70,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                    notification.products!.first.image!.first),
              ),
            ),
          ),
          title: Text(
            _notificationTitle(
              notification.notifications!.first.status,
            ),
            style: _theme.textTheme.headline4!.copyWith(height: 1.2),
          ),
          subtitle: RichText(
            text: TextSpan(
              style: _theme.textTheme.subtitle2!.copyWith(height: 1.2),
              children: [
                TextSpan(
                    text:
                        // ignore: lines_longer_than_80_chars
                        '${AppLocalizations.of(context)!.order_by_number} '),
                TextSpan(
                  text: '${notification.transactionCode!} ',
                  style: _theme.textTheme.subtitle2!
                      .copyWith(color: _theme.primaryColor),
                ),
                TextSpan(
                  text: _notificationSubtitle(
                      notification.notifications!.first.status),
                ),
              ],
            ),
          ),
          children: notification.notifications!
              .map(
                (e) => ListTile(
                  contentPadding: const EdgeInsets.fromLTRB(
                    50,
                    Const.margin,
                    50,
                    0,
                  ),
                  title: Text(
                    _notificationTitle(
                      e.status,
                    ),
                    style: _theme.textTheme.headline4!.copyWith(
                      height: 1.2,
                      color: ColorLight.fontSubtitle,
                    ),
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                      style: _theme.textTheme.subtitle2!.copyWith(height: 1.2),
                      children: [
                        TextSpan(
                          text:
                              '${AppLocalizations.of(context)!.order_by_number} ',
                        ),
                        TextSpan(
                          text: '${notification.transactionCode!} ',
                          style: _theme.textTheme.subtitle2!.copyWith(
                            color: _theme.primaryColor,
                          ),
                        ),
                        TextSpan(
                          text: _notificationTitle(
                            e.status,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ));
  }
}
