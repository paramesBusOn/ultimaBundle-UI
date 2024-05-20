part of '../chat_page.dart';

class _BuildBubbleChat extends StatelessWidget {
  final ConversationModel data;
  final String photoProfile;

  const _BuildBubbleChat({required this.data, required this.photoProfile});

  @override
  Widget build(BuildContext context) {
    return (data.isSender == true)
        ? senderChatBubble(context)
        : receiverChatBubble(context);
  }

  Align receiverChatBubble(BuildContext context) {
    final _theme = Theme.of(context);
    // final _themeMode = Provider.of<ThemeProvider>(context);

    return Align(
      alignment: Alignment.topLeft,
      child: Container(
          margin: const EdgeInsets.only(bottom: Const.space25),
          child: Row(
            children: [
              
              const SizedBox(width: Const.margin),
              CircleAvatar(
                radius: 25,
                backgroundColor: _theme.cardColor,
                backgroundImage: CachedNetworkImageProvider(photoProfile),
              ),
              const SizedBox(width: Const.space12),
              Container(
                margin: const EdgeInsets.only(right: Const.space25),
                padding: const EdgeInsets.all(Const.space12),
                constraints: BoxConstraints(
                  maxWidth: Screens.width(context)/2,
                ),
                decoration: BoxDecoration(
                  color: _theme.cardColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(data.text ?? '', style: _theme.textTheme.bodyText2),
                    const SizedBox(height: Const.space5),
                    Text(
                      DateFormat.jm().format(data.dateTime ?? DateTime.now()),
                      style: _theme.textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Align senderChatBubble(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.topRight,
      child: Container(
          margin: const EdgeInsets.only(bottom: Const.space25),
          alignment: Alignment.topRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(width: Const.space12),
              Container(
                margin: const EdgeInsets.only(right: Const.space25),
                padding: const EdgeInsets.all(Const.space12),
                constraints: BoxConstraints(
                  maxWidth: Screens.width(context)/2,
                ),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(Const.space15),
                    bottomLeft: Radius.circular(Const.space15),
                    bottomRight: Radius.circular(Const.space15),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      data.text ?? '',
                      style: theme.textTheme.bodyText2?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: Const.space5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          DateFormat.jm().format(data.dateTime ?? DateTime.now()),
                          style: theme.textTheme.subtitle2?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: Const.space8),
                        Icon(
                          Icons.done_all,
                          color: theme.backgroundColor,
                          size: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
