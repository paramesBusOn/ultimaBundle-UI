part of '../main.dart';


class _UIKitTabBar extends StatelessWidget {
  const _UIKitTabBar({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final _theme =Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: ResponsiveGridList(
          desiredItemWidth: 150,
          minSpacing: 18,
          children: allFullUIKitList(context).map((i) {
            return InkWell(
              onTap: i.navigation,
              child: SizedBox(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: OctoImage(
                        image: CachedNetworkImageProvider(
                          i.image ?? '',
                        ),
                        width: 150,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      i.name ?? '',
                      style: _theme.textTheme.headline4,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${i.totalScreen} Screens',
                      style: _theme.textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}

