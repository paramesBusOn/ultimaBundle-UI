import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onTap;
  final String? label;
  final double height;
  final double width;
  final Color color;
  final Color labelColor;
  final BorderRadiusGeometry? borderRadius;

  const CustomElevatedButton({
    Key? key,
    required this.onTap,
    required this.label,
    this.width = double.infinity,
    this.height = 45.0,
    required this.color,
    this.labelColor = Colors.white,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
              borderRadius: (borderRadius == null)
                  ? BorderRadius.circular(15)
                  : borderRadius!,
            )),
        child: Text(
          label ?? '',
          textAlign: TextAlign.center,
          style: theme.textTheme.button?.copyWith(color: labelColor),
        ),
      ),
    );
  }
}
