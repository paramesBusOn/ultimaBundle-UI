part of '../sign_in_page.dart';

class _BuildTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextInputType textInputType;
  final String hintText;
  final Widget? suffixIcon;
  final IconData icon;
  final EdgeInsetsGeometry? padding;

  const _BuildTextField({
    Key? key,
    required this.label,
    required this.obscureText,
    required this.textInputType,
    required this.hintText,
    required this.icon,
    this.suffixIcon,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            label,
            style: theme.textTheme.subtitle2!.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        TextField(
          cursorColor: Colors.white,
          obscureText: obscureText,
          style: theme.textTheme.bodyText2!.copyWith(color: Colors.white),
          keyboardType: textInputType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: theme.textTheme.subtitle2!.copyWith(
              color: Colors.white70,
            ),
            contentPadding: padding,
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            suffixIcon: suffixIcon,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
