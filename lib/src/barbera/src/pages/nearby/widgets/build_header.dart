part of '../nearby_page.dart';

class _BuildHeader extends StatelessWidget {
  final TextEditingController controller;

  const _BuildHeader({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.your_location,
                        style: _theme.textTheme.subtitle2),
                    const SizedBox(height: Const.space5),
                    Row(
                      children: [
                        Icon(
                          FeatherIcons.mapPin,
                          color: _theme.primaryColor,
                          size: 15,
                        ),
                        const SizedBox(width: Const.space5),
                        Text(
                          'San Fransisco City',
                          style: _theme.textTheme.headline3,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => _changeAddressBottomSheet(
                  context,
                  controller: controller,
                ),
                borderRadius: BorderRadius.circular(Const.radius),
                child: Row(
                  children: [
                    Icon(
                      FeatherIcons.edit,
                      color: _theme.primaryColor,
                      size: 15,
                    ),
                    const SizedBox(width: Const.space5),
                    Text(
                      AppLocalizations.of(context)!.change,
                      style: _theme.textTheme.subtitle2
                          ?.copyWith(color: _theme.primaryColor),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: Const.space25),
          InkWell(
            onTap: () => Get.toNamed<dynamic>(BarberaRoutes.search),
            child: Container(
              width: double.infinity,
              height: 45,
              padding: const EdgeInsets.symmetric(
                horizontal: Const.space12,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: _theme.disabledColor),
                color: _theme.disabledColor.withOpacity(.5),
                borderRadius: BorderRadius.circular(Const.radius),
              ),
              child: Row(
                children: [
                  Icon(
                    FeatherIcons.search,
                    color: _theme.primaryColor,
                  ),
                  const SizedBox(width: Const.space12),
                  Text(
                    AppLocalizations.of(context)!.search_for_barbershop_name,
                    style: _theme.textTheme.subtitle1?.copyWith(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
