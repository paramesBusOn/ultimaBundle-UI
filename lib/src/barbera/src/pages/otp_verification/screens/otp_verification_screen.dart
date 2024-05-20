part of '../otp_verification_page.dart';

class BarberaOTPVerificationScreen extends StatefulWidget {
  const BarberaOTPVerificationScreen({Key? key}) : super(key: key);

  @override
  _BarberaOTPVerificationScreenState createState() => _BarberaOTPVerificationScreenState();
}

class _BarberaOTPVerificationScreenState extends State<BarberaOTPVerificationScreen> {
  late TextEditingController _controller;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(context),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        children: [
          SvgPicture.asset(
            Assets.otp,
            height: 200,
          ),
          const SizedBox(height: Const.space25),
          Text(
            AppLocalizations.of(context)!.verification_code,
            style: _theme.textTheme.headline3,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Const.space12),
          Text(
            AppLocalizations.of(context)!
                .we_have_sent_the_code_verification_to_your_phone_number,
            textAlign: TextAlign.center,
            style: _theme.textTheme.subtitle1,
          ),
          const SizedBox(height: Const.space15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.space25),
            child: PinCodeTextField(
              appContext: context,
              controller: _controller,
              length: 4,
              textStyle: _theme.textTheme.headline3,
              animationType: AnimationType.fade,
              cursorColor: _theme.primaryColor,
              onChanged: (v) {},
              pinTheme: PinTheme(
                activeColor: _theme.primaryColor,
                selectedColor: _theme.primaryColor,
                inactiveColor: _theme.disabledColor,
                shape: PinCodeFieldShape.circle,
              ),
              keyboardType: TextInputType.number,
              onCompleted: (v) {
                setState(() => _isLoading = true);
                Future.delayed(const Duration(seconds: 2), () {
                  setState(() => _isLoading = false);
                  Get.offAllNamed<dynamic>(BarberaRoutes.home);
                });
              },
            ),
          ),
          const SizedBox(height: Const.space15),
          CustomElevatedButton(
            onTap: () {
              setState(() => _isLoading = true);
              Future.delayed(const Duration(seconds: 2), () {
                setState(() => _isLoading = false);
                Get.offAllNamed<dynamic>(BarberaRoutes.home);
              });
            },
            isLoading: _isLoading,
            label: AppLocalizations.of(context)!.send,
            labelLoading: AppLocalizations.of(context)!.sending,
          ),
          const SizedBox(height: Const.space25),
          Text(
            AppLocalizations.of(context)!.didnt_you_received_any_code,
            textAlign: TextAlign.center,
            style: _theme.textTheme.subtitle1,
          ),
          const SizedBox(height: Const.space5),
          InkWell(
            onTap: () {
              showToast(
                msg: AppLocalizations.of(context)!.resend_a_new_code_on_click,
              );
            },
            child: Text(
              AppLocalizations.of(context)!.resend_a_new_code,
              textAlign: TextAlign.center,
              style: _theme.textTheme.subtitle1?.copyWith(
                color: _theme.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
