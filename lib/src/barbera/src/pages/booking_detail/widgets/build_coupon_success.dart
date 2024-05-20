part of '../booking_detail_page.dart';


class _BuildCouponSuccess extends StatelessWidget {
  const _BuildCouponSuccess({
    Key? key,
    required this.isCorrect,
    required this.couponController,
  }) : super(key: key);

  final bool isCorrect;
  final TextEditingController couponController;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(Const.space15),
      margin: const EdgeInsets.symmetric(horizontal: Const.margin),
      decoration: BoxDecoration(
        border: Border.all(
          color: isCorrect ? Colors.green : _theme.errorColor,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            couponController.text,
            style: _theme.textTheme.headline3,
          ),
          Text(
            isCorrect ? 'COUPON APPLIED' : 'COUPON DECLINED',
            style: _theme.textTheme.headline3?.copyWith(
                color: isCorrect ? Colors.green : _theme.errorColor),
          ),
        ],
      ),
    );
  }
}
