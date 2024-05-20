part of '../inbox_page.dart';

class _BuildListTile extends StatelessWidget {
  final ChatModel chat;

  const _BuildListTile({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return ListTile(
      onTap: () {
        Get.toNamed<dynamic>(BarberaRoutes.chat,arguments: chat);
      },
      contentPadding: EdgeInsets.zero,
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: _theme.cardColor,
            backgroundImage:
                CachedNetworkImageProvider(chat.barber?.photo ?? ''),
          ),
          if (chat.totalUnread == null || chat.totalUnread == 0)
            const SizedBox()
          else
            Positioned(
              right: 0,
              bottom: 0,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: _theme.primaryColor,
                child: Text(
                  chat.totalUnread.toString(),
                  style: _theme.textTheme.subtitle2?.copyWith(
                    color: Colors.white,
                    // fontSize: 5,
                  ),
                ),
              ),
            )
        ],
      ),
      title: Text(chat.barber?.name ?? '', style: _theme.textTheme.headline3),
      subtitle: Text(
        chat.lastMessage ?? '',
        style: _theme.textTheme.subtitle2,
        maxLines: 1,
      ),
      trailing: Text(
        DateFormat.jm().format(chat.dateTime ?? DateTime.now()),
        style: _theme.textTheme.subtitle2?.copyWith(fontSize: 10),
      ),
    );
  }
}
