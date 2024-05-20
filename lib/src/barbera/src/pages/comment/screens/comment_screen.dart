part of '../comment_page.dart';

class BarberaCommentScreen extends StatefulWidget {
  const BarberaCommentScreen({Key? key}) : super(key: key);

  @override
  _BarberaCommentScreenState createState() => _BarberaCommentScreenState();
}

class _BarberaCommentScreenState extends State<BarberaCommentScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '');
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: AppLocalizations.of(context)!.comment,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: allCommentList.length,
              itemBuilder: (context, index) {
                final _comment = allCommentList[index];
                return _BuildCommentCard(comment: _comment, index: index);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Const.margin,
              vertical: Const.space12,
            ),
            color: _theme.cardColor,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: _theme.disabledColor,
                  backgroundImage:
                      const CachedNetworkImageProvider(Assets.profilePhoto),
                ),
                const SizedBox(width: Const.space15),
                Expanded(
                  child: CustomTextFormField(
                    controller: _controller,
                    hintText: AppLocalizations.of(context)!.type_a_message,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showToast(
                      msg:
                          AppLocalizations.of(context)!.send_a_message_on_click,
                    );
                  },
                  icon: const Icon(FeatherIcons.send),
                  color: _theme.primaryColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
