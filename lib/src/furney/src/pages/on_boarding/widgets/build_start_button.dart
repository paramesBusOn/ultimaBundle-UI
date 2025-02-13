part of '../on_boarding_page.dart';

class _BuildStartButton extends StatelessWidget {
  final int? index;

  const _BuildStartButton({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  (index != 2)
              ? const SizedBox()
              : Positioned(
        bottom: Screens.heigth(context) / 15,
        left: Const.margin,
        right: Const.margin,
        child: CustomFadeTransition(
          axis: Axis.vertical,
          duration:const Duration(milliseconds: 200),
          child: CustomElevatedButton(
            label: AppLocalizations.of(context)!.get_started,
            onTap: () => Get.toNamed<dynamic>(FurneyRoutes.signIn),
          ),
        ),
      );
  }
}
