part of '../following_page.dart';

class BarberaFollowingScreen extends StatelessWidget {
  const BarberaFollowingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: AppLocalizations.of(context)!.following,
      ),
      body: ListView.builder(
        itemCount: topBarberList.length,
        itemBuilder: (context, index) {
          final following = topBarberList[index];

          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: Const.margin,
            ),
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: _theme.disabledColor,
              backgroundImage: CachedNetworkImageProvider(
                following.photo ?? '',
              ),
            ),
            title: Text(
              following.name ?? '',
              maxLines: 1,
              style: _theme.textTheme.headline4,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('@alexa121', style: _theme.textTheme.subtitle2),
                Text(
                  'Hi, just example',
                  style: _theme.textTheme.subtitle1,
                ),
              ],
            ),
            trailing: CustomElevatedButton(
              onTap: () {},
              label: AppLocalizations.of(context)!.following,
              width: 100,
              height: 30,
            ),
          );
        },
      ),
    );
  }
}
