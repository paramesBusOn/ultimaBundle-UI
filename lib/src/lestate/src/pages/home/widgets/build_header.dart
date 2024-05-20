part of '../home_page.dart';



class _BuildHeader extends StatelessWidget {
  const _BuildHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppLocalizations.of(context)!.hello,
                      style: _theme.textTheme.headline1,
                    ),
                    TextSpan(
                      text: '\nJessica Veranda 👋',
                      style: _theme.textTheme.headline1,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Const.space15),
              Text(
                'Let’s find the best Real Estate with us! ',
                style: _theme.textTheme.subtitle1,
              )
            ],
          ),
          SizedBox(
            width: 60,
            height: 60,
            child: Stack(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Const.radius),
                    color: _theme.disabledColor.withOpacity(.2),
                  ),
                  child: Icon(
                    IconlyBold.notification,
                    color: _theme.primaryColor,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: const Color(0xFFFFC27B),
                    child: Text(
                      '1',
                      style: _theme.textTheme.subtitle2?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
