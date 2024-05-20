part of '../profile_edit_page.dart';

class _BuildBirthdayTextField extends StatelessWidget {
  const _BuildBirthdayTextField({
    Key? key,
    required this.onTap,
    this.selectedDate,
  }) : super(key: key);

  final VoidCallback onTap;
  final String? selectedDate;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Screens.width(context),
        height: 45,
        margin: const EdgeInsets.symmetric(horizontal: Const.margin),
        decoration: BoxDecoration(
          border: Border.all(color: _theme.disabledColor),
          borderRadius: BorderRadius.circular(Const.textFieldRadius),
        ),
        padding: const EdgeInsets.symmetric(horizontal: Const.space12),
        alignment: Alignment.centerLeft,
        child: Text(
          (selectedDate == '' || selectedDate == null)
              ? AppLocalizations.of(context)!.select_your_birthday
              : selectedDate ??
                  AppLocalizations.of(context)!.select_your_birthday,
          style: (selectedDate == '' || selectedDate == null)
              ? _theme.textTheme.subtitle1
              : _theme.textTheme.bodyText2,
        ),
      ),
    );
  }
}
