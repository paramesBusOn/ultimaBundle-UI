part of '../payment_page.dart';

class _BuildExpDateAndCvv extends StatelessWidget {
  final VoidCallback onSelectDateTap;
  final String expDate;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const _BuildExpDateAndCvv({
    Key? key,
    required this.onSelectDateTap,
    required this.expDate,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Row(
        children: [
          InkWell(
            onTap: onSelectDateTap,
            borderRadius: BorderRadius.circular(Const.radius),
            child: Container(
              width: _width / 1.7,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Const.radius),
                border: Border.all(color: _theme.disabledColor),
              ),
              padding: const EdgeInsets.only(left: Const.space12),
              alignment: Alignment.centerLeft,
              child: Text(
                (expDate == '')
                    ? AppLocalizations.of(context)!.exp_date
                    : expDate,
                style: (expDate == '')
                    ? _theme.textTheme.subtitle1
                    : _theme.textTheme.bodyText2,
              ),
            ),
          ),
          const SizedBox(width: Const.space12),
          Expanded(
            child: CustomTextFormField(
              controller: controller,
              hintText: AppLocalizations.of(context)!.cvv,
              textInputType: TextInputType.number,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
