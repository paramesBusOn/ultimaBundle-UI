part of '../inbox_page.dart';

class _ChatCard extends StatelessWidget {
  final ChatModel chat;

  const _ChatCard({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return InkWell(
      onTap: () => Get.toNamed<dynamic>(LestateRoutes.chat, arguments: chat),
      child: Slidable(
        actionPane: const SlidableDrawerActionPane(),
        secondaryActions: [
          IconSlideAction(
            caption: AppLocalizations.of(context)!.delete,
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => showToast(
              msg: AppLocalizations.of(context)!.remove_from_inbox,
            ),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Const.margin,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Const.radius),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          chat.profilePhoto ?? '',
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
                          chat.name ?? '',
                          style: _theme.textTheme.bodyText1,
                        ),
                        Text(
                          chat.lastMessage ?? '',
                          style: _theme.textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat.jm().format(chat.dateTime!),
                        style: _theme.textTheme.subtitle2,
                      ),
                      const SizedBox(height: Const.space8),
                      if (chat.unReadMessage == 0)
                        const SizedBox()
                      else
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Const.accentColor,
                          child: Text(
                            chat.unReadMessage.toString(),
                            style: _theme.textTheme.subtitle2?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        )
                    ],
                  )
                ],
              ),
              const SizedBox(height: Const.space15),
              Divider(color: _theme.primaryColor),
              const SizedBox(height: Const.space15),
            ],
          ),
        ),
      ),
    );
  }
}
