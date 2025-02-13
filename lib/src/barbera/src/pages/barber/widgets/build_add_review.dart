part of '../barber_page.dart';

class _BuildAddReview extends StatelessWidget {
  const _BuildAddReview({
    Key? key,
    required this.isLoading,
    required this.reviewController,
    required this.onSendReviewTap,
  }) : super(key: key);

  final TextEditingController reviewController;
  final VoidCallback onSendReviewTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Const.margin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.write_your_review,
                style: _theme.textTheme.bodyText2,
              ),
              CustomRating(
                onRating: (v) {},
                star: Star(
                  emptyColor: _theme.disabledColor,
                  fillColor: _theme.primaryColor,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: Const.space12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              Container(
                width: 55,
                height: 55,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: _theme.primaryColor),
                ),
                child: CircleAvatar(
                  backgroundColor: _theme.disabledColor,
                  backgroundImage: const CachedNetworkImageProvider(
                    Assets.profilePhoto,
                  ),
                ),
              ),
              const SizedBox(width: Const.space12),
              Expanded(
                child: CustomTextFormField(
                  controller: reviewController,
                  hintText: AppLocalizations.of(context)!.leave_your_experience,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: Const.space12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Const.margin),
          child: Align(
            alignment: Alignment.bottomRight,
            child: CustomElevatedButton(
              onTap: onSendReviewTap,
              label: AppLocalizations.of(context)!.send,
              labelLoading: AppLocalizations.of(context)!.sending,
              isLoading: isLoading,
            ),
          ),
        ),
      ],
    );
  }
}
