part of '../appointment_detail_page.dart';



class _BuildBookingDetail extends StatelessWidget {
  const _BuildBookingDetail({
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

    IconData _icon(AppointmentStatus status) {
      switch (status) {
        case AppointmentStatus.pending:
          return FeatherIcons.clock;
        case AppointmentStatus.complete:
          return FeatherIcons.checkCircle;

        case AppointmentStatus.cancel:
          return FeatherIcons.xCircle;
        default:
          return FeatherIcons.clock;
      }
    }

    return Container(
      width: Screens.width(context),
      padding: const EdgeInsets.symmetric(
        horizontal: Const.space15,
        vertical: Const.space25,
      ),
      decoration: BoxDecoration(
        color: _theme.cardColor,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(Const.space15),
          bottomLeft: Radius.circular(Const.space15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Const.space12),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      appointment.barbershop?.images?.first ?? '',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: Const.space12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment.barbershop?.name ?? '',
                      style: _theme.textTheme.headline2,
                    ),
                    const SizedBox(height: Const.space8),
                    Text(
                      appointment.barbershop?.address ?? '',
                      style: _theme.textTheme.bodyText2?.copyWith(
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: Const.space15),
          Row(
            children: [
              Icon(
                _icon(appointment.status!),
                color: _theme.primaryColor,
              ),
              const SizedBox(width: Const.space12),
              Text(_status(appointment.status!),
                  style: _theme.textTheme.bodyText2),
            ],
          ),
          const SizedBox(height: Const.space12),
          Row(
            children: [
              Icon(FeatherIcons.calendar, color: _theme.primaryColor),
              const SizedBox(width: Const.space12),
              Text('${appointment.date} - ${appointment.time}',
                  style: _theme.textTheme.bodyText2),
            ],
          ),
        ],
      ),
    );
  }
}
