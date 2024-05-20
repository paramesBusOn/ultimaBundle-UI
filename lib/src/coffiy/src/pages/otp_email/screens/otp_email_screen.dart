part of '../otp_email_page.dart';

class CoffiyOTPEmailScreen extends StatefulWidget {
  const CoffiyOTPEmailScreen({Key? key}) : super(key: key);

  @override
  State<CoffiyOTPEmailScreen> createState() => _CoffiyOTPEmailScreenState();
}

class _CoffiyOTPEmailScreenState extends State<CoffiyOTPEmailScreen> {
  late TextEditingController _otpController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
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
          const SizedBox(height: Const.space25 * 2),
          Text(
            AppLocalizations.of(context)!.reset_password,
            style: _theme.textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Const.space25 * 2),
          Text(
            AppLocalizations.of(context)!.enter_the_otp_code_we_sent_you,
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
            onTap: () {
              setState(() => _isLoading = true);
              Future.delayed(const Duration(seconds: 2), () {
                Get.toNamed<dynamic>(CoffiyRoutes.changePassword);
              });
            },
            isLoading: _isLoading,
            label: AppLocalizations.of(context)!.verify_now,
            labelLoading: AppLocalizations.of(context)!.verifying,
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
          )
        ],
      ),
    );
  }
}
