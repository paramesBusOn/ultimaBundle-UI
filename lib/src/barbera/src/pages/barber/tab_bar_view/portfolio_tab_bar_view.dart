part of '../barber_page.dart';

class _PortfolioTabBarView extends StatelessWidget {
  final BarberModel barber;

  const _PortfolioTabBarView({Key? key, required this.barber}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: allGalleryList.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      itemBuilder: (BuildContext context, int index) {
        final gallery = allGalleryList[index];
        return _BuildGalleryCard(
          gallery: gallery,
        );
      },
      staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
    );
  }
}
