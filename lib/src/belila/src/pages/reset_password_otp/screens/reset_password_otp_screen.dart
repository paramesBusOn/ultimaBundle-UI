part of '../reset_password_otp_page.dart';

class BelilaResetPasswordOTPScreen extends StatefulWidget {
  const BelilaResetPasswordOTPScreen({Key? key}) : super(key: key);

  @override
  _BelilaResetPasswordOTPScreenState createState() => _BelilaResetPasswordOTPScreenState();
}

class _BelilaResetPasswordOTPScreenState extends State<BelilaResetPasswordOTPScreen> {
  late TextEditingController _otpController;
  bool _isLoading = false;
  bool _countdown = false;

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
          Text(
            AppLocalizations.of(context)!.verification_code,
            style: _theme.textTheme.headline1,
          ),
          const SizedBox(height: Const.space12),
          Text(
            AppLocalizations.of(context)!
                .enter_the_verification_code_we_just_sent_you_on_your_email_address,
            style: _theme.textTheme.bodyText2,
          ),
          const SizedBox(height: Const.space25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: Center(
              child: PinPut(
                fieldsCount: 4,
                controller: _otpController,
                followingFieldDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Const.radius),
                  border: Border.all(color: _theme.hintColor),
                ),
                submittedFieldDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: _theme.primaryColor),
                ),
                selectedFieldDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Const.radius),
                  border: Border.all(color: _theme.primaryColor),
                ),
                fieldsAlignment: MainAxisAlignment.spaceEvenly,
                textStyle: _theme.textTheme.headline3,
                eachFieldPadding: const EdgeInsets.symmetric(
                  horizontal: Const.space12,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          CustomElevatedButton(
            isLoading: _isLoading,
            onTap: () async {
              setState(() {
                _isLoading = true;
              });
              Future.delayed(const Duration(seconds: 2), () {
                setState(() {
                  _isLoading = false;
                });
                Get.toNamed<dynamic>(BelilaRoutes.newPassword);
              });
            },
            label: AppLocalizations.of(context)!.done,
          ),
          const SizedBox(height: Const.space25),
          if (_countdown == true)
            Center(
              child: Countdown(
                seconds: 60,
                build: (BuildContext context, double time) => Text(
                  // ignore: lines_longer_than_80_chars
                  '${AppLocalizations.of(context)!.can_send_again_in} ${'${time.toInt()} ${AppLocalizations.of(context)!.seconds}'} ${AppLocalizations.of(context)!.again}',
                  style: _theme.textTheme.subtitle2,
                ),
                onFinished: () {
                  setState(() {
                    _countdown = false;
                  });
                },
              ),
            )
          else
            const SizedBox(),
          const SizedBox(height: Const.space15),
          CustomTextButton(
            label: AppLocalizations.of(context)!.send_the_code_again,
            onTap: () {
              setState(() {
                _countdown = true;
              });
            },
            textColor: _theme.primaryColor,
          ),
          const SizedBox(height: Const.space8),
          CustomTextButton(
            label: AppLocalizations.of(context)!.change_email_address,
            onTap: Get.back,
            textColor: _theme.primaryColor,
          ),
        ],
      ),
    );
  }
}
