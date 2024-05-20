part of '../forgot_password_success_page.dart';

class BellcommerceForgotPasswordSuccessScreen extends StatelessWidget {
  const BellcommerceForgotPasswordSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Illustrations.forgotPasswordSuccess,
              width: 200,
            ),
            const SizedBox(height: Const.space25*2),
            Text(
              AppLocalizations.of(context)!.success,
              style: _theme.textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Const.space15),
            Text(
              AppLocalizations.of(context)!
                  .password_reset_request_was_sent_successfully_please_check_your_email_to_reset_your_password,
              style: _theme.textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Const.space25),
            CustomElevatedButton(
              onTap: (){
                Get.offAllNamed<dynamic>(BellcommerceRoutes.signIn);
              },
              label: AppLocalizations.of(context)!.back_to_sign_in,
            ),
            const SizedBox(height: Const.space25),
          ],
        ),
      ),
    );
  }
}
