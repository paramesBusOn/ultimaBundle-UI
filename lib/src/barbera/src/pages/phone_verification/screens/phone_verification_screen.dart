part of '../phone_verification_page.dart';

class BarberaPhoneVerificationScreen extends StatefulWidget {
  const BarberaPhoneVerificationScreen({Key? key}) : super(key: key);

  @override
  _BarberaPhoneVerificationScreenState createState() =>
      _BarberaPhoneVerificationScreenState();
}

class _BarberaPhoneVerificationScreenState extends State<BarberaPhoneVerificationScreen> {
  late TextEditingController _phoneNumberController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    super.dispose();
    _phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(context),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        children: [
          Text(
            AppLocalizations.of(context)!.verify_your_phone_number,
            style: _theme.textTheme.headline3,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Const.space12),
          Text(
            AppLocalizations.of(context)!
                .we_will_send_a_OTP_Code_for_verify_phone_numbers_its_you,
            style: _theme.textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Const.space25),
          _BuildPhoneTextField(controller: _phoneNumberController),
          const SizedBox(height: Const.space25),
          CustomElevatedButton(
            onTap: () {
              setState(() => _isLoading = true);
              Future.delayed(const Duration(seconds: 2), () {
                setState(() => _isLoading = false);
                 Get.toNamed<dynamic>(BarberaRoutes.otpVerification);
              });
            },
            label: AppLocalizations.of(context)!.send,
            isLoading: _isLoading,
            labelLoading: AppLocalizations.of(context)!.sending,
          ),
          const SizedBox(height: Const.space25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.or_login_with,
                  style: _theme.textTheme.subtitle1),
              GestureDetector(
                onTap: () => Get.offAllNamed<dynamic>(BarberaRoutes.socialNetwork),
                child: Text(
                  AppLocalizations.of(context)!.social_network,
                  style: _theme.textTheme.subtitle1?.copyWith(
                    color: _theme.primaryColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
