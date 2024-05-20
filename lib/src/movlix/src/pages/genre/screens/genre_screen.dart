part of '../genre_page.dart';

class MovlixGenreScreen extends StatelessWidget {
  const MovlixGenreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(
              Const.margin,
              50,
              Const.margin,
              0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Genres', style: _theme.textTheme.headline1),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Const.radius),
                      color: _theme.cardColor),
                  child: IconButton(
                    onPressed: () => Get.toNamed<dynamic>(MovlixRoutes.search),
                    icon: const Icon(FeatherIcons.search),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: genreList.length,
              itemBuilder: (BuildContext context, int index) {
                final _genre = genreList[index];
                return ListTile(
                  onTap: ()=> Get.toNamed<dynamic>(MovlixRoutes.browse),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: Const.margin,
                  ),
                  title: Text(
                    _genre.name ?? '',
                    style: _theme.textTheme.bodyText2,
                  ),
                  subtitle: const Divider(),
                  trailing: const Icon(Icons.arrow_forward_ios),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
