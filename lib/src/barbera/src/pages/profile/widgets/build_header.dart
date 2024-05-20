part of '../profile_page.dart';

class _BuildHeader extends StatelessWidget {
  const _BuildHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      width: Screens.width(context),
      height: 170,
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: _theme.unselectedWidgetColor,
                backgroundImage: const CachedNetworkImageProvider(
                  Assets.profilePhoto,
                ),
              ),
              const SizedBox(width: Const.space15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jessica Veranda',
                      style: _theme.textTheme.headline1,
                    ),
                    const SizedBox(height: Const.space5),
                    Text(
                      'jscvrnd19@gmail.com',
                      style: _theme.textTheme.subtitle2,
                    ),
                    const SizedBox(height: Const.space15),
                    CustomElevatedButton(
                      height: 30,
                      onTap: () => Get.toNamed<dynamic>(BarberaRoutes.profileEdit),
                      label: AppLocalizations.of(context)!.edit_profile,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: Const.space15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(Const.radius),
                  onTap: () => Get.toNamed<dynamic>(BarberaRoutes.following),
                  child: Column(
                    children: [
                      Text('128', style: _theme.textTheme.headline4),
                      Text(
                        AppLocalizations.of(context)!.following,
                        style: _theme.textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(Const.radius),
                  onTap: () => Get.toNamed<dynamic>(BarberaRoutes.follower),
                  child: Column(
                    children: [
                      Text('640', style: _theme.textTheme.headline4),
                      Text(
                        AppLocalizations.of(context)!.follower,
                        style: _theme.textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(Const.radius),
                  onTap: () => Get.toNamed<dynamic>(BarberaRoutes.like),
                  child: Column(
                    children: [
                      Text('240', style: _theme.textTheme.headline4),
                      Text(
                        AppLocalizations.of(context)!.likes,
                        style: _theme.textTheme.subtitle2,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
