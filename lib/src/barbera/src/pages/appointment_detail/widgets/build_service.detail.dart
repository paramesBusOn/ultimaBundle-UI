part of '../appointment_detail_page.dart';

class _BuildServiceDetail extends StatelessWidget {
  const _BuildServiceDetail({
    Key? key,
    required this.appointment,
  }) : super(key: key);

  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    String _status(AppointmentStatus status) {
      switch (status) {
        case AppointmentStatus.pending:
          return AppLocalizations.of(context)!.pending;
        case AppointmentStatus.complete:
          return AppLocalizations.of(context)!.completed;
        case AppointmentStatus.cancel:
          return AppLocalizations.of(context)!.cancelled;
        default:
          return '';
      }
    }

    Color _statusColor(AppointmentStatus status) {
      switch (status) {
        case AppointmentStatus.pending:
          return Colors.amber;
        case AppointmentStatus.complete:
          return Colors.green;
        case AppointmentStatus.cancel:
          return Colors.red;
        default:
          return Colors.white;
      }
    }

    return Container(
      width: Screens.width(context),
      margin: const EdgeInsets.symmetric(horizontal: Const.margin),
      padding: const EdgeInsets.all(Const.margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Const.space12),
        border: Border.all(color: _theme.primaryColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.services,
                  style: _theme.textTheme.headline5),
              Text(AppLocalizations.of(context)!.price,
                  style: _theme.textTheme.headline5),
            ],
          ),
          const SizedBox(height: Const.space12),
          Column(
            children: appointment.services!
                .map(
                  (e) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        e.name ?? '',
                        style: _theme.textTheme.bodyText2?.copyWith(
                          color: _theme.unselectedWidgetColor,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                          symbol: r'$',
                          decimalDigits: 0,
                        ).format(e.price),
                        style: _theme.textTheme.bodyText2?.copyWith(
                          color: _theme.unselectedWidgetColor,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: Const.space12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.estimated_duration,
                style: _theme.textTheme.headline5,
              ),
              Text(
                AppLocalizations.of(context)!.payment_status,
                style: _theme.textTheme.headline5,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${appointment.totalDuration} min',
                  style: _theme.textTheme.bodyText2),
              Text(
                _status(appointment.status!),
                style: _theme.textTheme.bodyText2?.copyWith(
                  color: _statusColor(appointment.status!),
                ),
              ),
            ],
          ),
          const SizedBox(height: Const.space12),
          Text(
            AppLocalizations.of(context)!.appointment_number,
            style: _theme.textTheme.headline5,
          ),
          Text(
            appointment.bookingNumber ?? '',
            style: _theme.textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
