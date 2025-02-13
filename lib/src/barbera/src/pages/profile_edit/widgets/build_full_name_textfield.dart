part of '../profile_edit_page.dart';

class _BuildFullNameTextField extends StatelessWidget {
  const _BuildFullNameTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: CustomTextFormField(
        controller: controller,
        hintText: AppLocalizations.of(context)!.email_address,
        textInputType: TextInputType.emailAddress,
      ),
    );
  }
}
