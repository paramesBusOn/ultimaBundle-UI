part of '../estate_page.dart';

class _BuildOwnerListTile extends StatelessWidget {
  const _BuildOwnerListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    const _number = 4789985779;

    return Column(
      children: [
        Divider(color: _theme.primaryColor),
        const SizedBox(height: Const.space12),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Const.margin,
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Const.radius),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      mockUser.image ?? '',
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
                      mockUser.name ?? '',
                      style: _theme.textTheme.bodyText1,
                    ),
                    Text(
                      'Owner',
                      style: _theme.textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => Get.toNamed<dynamic>(
                  LestateRoutes.chat,
                  arguments: chatList.first,
                ),
                child: Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Const.radius),
                  ),
                  child: const SizedBox(
                    height: 40,
                    width: 40,
                    child: Icon(
                      IconlyBold.message,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await launch('tel:$_number');
                },
                child: Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Const.radius),
                  ),
                  child: const SizedBox(
                    height: 40,
                    width: 40,
                    child: Icon(
                      IconlyBold.call,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: Const.space12),
        Divider(color: _theme.primaryColor),
      ],
    );
  }
}
