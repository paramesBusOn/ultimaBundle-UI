import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:ultimate_bundle/providers/theme_provider.dart';
import 'package:ultimate_bundle/src/belila/src/helpers/colors.dart';

class CustomStarRating extends StatelessWidget {
  final double rating;
  final bool allowHalfRating;
  final RatingChangeCallback? onRatingChanged;

  const CustomStarRating({
    Key? key,
    this.rating = 0,
    this.allowHalfRating = false,
    this.onRatingChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeProv = Provider.of<ThemeProvider>(context);
    return SmoothStarRating(
      rating: rating,
      size: 18,
      onRatingChanged: onRatingChanged,
      allowHalfRating: allowHalfRating,
      color: themeProv.isDarkTheme ? ColorDark.warning : ColorLight.warning,
      borderColor:
          themeProv.isDarkTheme ? ColorDark.warning : ColorLight.warning,
    );
  }
}
