part of '../otp_phone_page.dart';

class LestateOTPPhoneScreen extends StatefulWidget {
  const LestateOTPPhoneScreen({Key? key}) : super(key: key);

  @override
  State<LestateOTPPhoneScreen> createState() => _LestateOTPPhoneScreenState();
}

class _LestateOTPPhoneScreenState extends State<LestateOTPPhoneScreen> {
  late TextEditingController _otpController;

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
          Center(
            child: SvgPicture.asset(
              Illustrations.otp,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: Const.space25),
          Text(
            AppLocalizations.of(context)!
                .enter_the_code_we_sent_via_sms_to_your_registered_phone,
            style: _theme.textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Const.space25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: PinPut(
              fieldsCount: 5,
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
            onTap: () => Get.toNamed<dynamic>(LestateRoutes.home),
            label: AppLocalizations.of(context)!.submit,
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
