part of '../otp_email_page.dart';

class LestateOTPEmailScreen extends StatefulWidget {
  const LestateOTPEmailScreen({Key? key}) : super(key: key);

  @override
  State<LestateOTPEmailScreen> createState() => _LestateOTPEmailScreenState();
}

class _LestateOTPEmailScreenState extends State<LestateOTPEmailScreen> {
  late TextEditingController _otpController;
  String _email = '';

  @override
  void initState() {
    super.initState();
    _email = Get.arguments as String;
    _otpController = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(context),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        children: [
          Center(
            child: SvgPicture.asset(
              Illustrations.otp,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: Const.space25),
          Text(
            '${AppLocalizations.of(context)!.please_enter_the_4_digit_code_sent_to} $_email',
            style: _theme.textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Const.space25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: PinPut(
              fieldsCount: 4,
              controller: _otpController,
              textStyle: _theme.textTheme.bodyText2,
              submittedFieldDecoration: BoxDecoration(
                border: Border.all(color: _theme.primaryColor),
                borderRadius: BorderRadius.circular(Const.radius),
              ),
              selectedFieldDecoration: BoxDecoration(
                border: Border.all(color: _theme.disabledColor),
                borderRadius: BorderRadius.circular(Const.radius),
              ),
              followingFieldDecoration: BoxDecoration(
                border: Border.all(color: _theme.disabledColor),
                borderRadius: BorderRadius.circular(Const.radius),
              ),
            ),
          ),
          const SizedBox(height: Const.space25),
          CustomElevatedButton(
            onTap: () => Get.toNamed<dynamic>(LestateRoutes.changePassword),
            label: AppLocalizations.of(context)!.verify_now,
          ),
          const SizedBox(height: Const.space25),
          Text(
            AppLocalizations.of(context)!.i_didnt_receive_the_code,
            style: _theme.textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
          CustomTextButton(
            onTap: () {
              showToast(
                msg: AppLocalizations.of(context)!.resend_a_new_code_on_click,
              );
            },
            label: AppLocalizations.of(context)!.resend_a_new_code,
            fontColor: Const.accentColor,
          )
        ],
      ),
    );
  }
}
