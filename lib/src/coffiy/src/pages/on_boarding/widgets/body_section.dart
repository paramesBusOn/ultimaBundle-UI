part of '../on_boarding_page.dart';

class _BodySection extends StatelessWidget {
  final ValueChanged<int>? onPageChanged;

  const _BodySection({Key? key, this.onPageChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return PageView.builder(
      itemCount: onBoardingList(context).length,
      onPageChanged:onPageChanged,
      itemBuilder: (context, index) {
        final data = onBoardingList(context)[index];
        return _OnBoardingCard(data: data);
      },
    );
  }
}
