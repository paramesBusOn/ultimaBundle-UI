part of '../home_page.dart';

class _BuildScrollableMovie extends StatelessWidget {
  final String label;
  final VoidCallback onSeeAllTap;
  final List<MovieModel> movieList;

  const _BuildScrollableMovie({
    Key? key,
    required this.label,
    required this.onSeeAllTap,
    required this.movieList,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Const.margin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: _theme.textTheme.headline3),
              InkWell(
                onTap: onSeeAllTap,
                child: Text(
                  AppLocalizations.of(context)!.see_all,
                  style: _theme.textTheme.subtitle1,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: Const.space12),
        SizedBox(
          width: double.infinity,
          height: 250,
          child: ListView.builder(
            itemCount: movieList.length,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final _movie = movieList[index];

              return _MovieCard(movie: _movie);
            },
          ),
        ),
      ],
    );
  }
}
