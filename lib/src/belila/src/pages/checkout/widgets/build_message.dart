part of '../checkout_page.dart';


class _BuildMessage extends StatelessWidget {
  const _BuildMessage({
    Key? key,
    this.messageController,
    required this.onChanged
  }) : super(key: key);

  final TextEditingController? messageController;
  final   ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.message,
            style: _theme.textTheme.bodyText1,
          ),
          const SizedBox(width: Const.space12),
          Expanded(
            child: TextField(
              controller: messageController,
              style: _theme.textTheme.bodyText2,
              autocorrect: false,
              textAlign: TextAlign.end,
              onChanged:onChanged ,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.please_leave_a_message,
                hintStyle: _theme.textTheme.subtitle2,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                
              ),
            ),
          )
        ],
      ),
    );
  }
}
