import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import 'package:ultimate_bundle/src/treshop/src/helpers/constants.dart';
import 'package:ultimate_bundle/src/treshop/src/models/cart_model.dart';
import 'package:ultimate_bundle/src/treshop/src/widgets/custom_network_image.dart';

class ProductCheckoutCard extends StatelessWidget {
  const ProductCheckoutCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final CartModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color _colorType(int val) {
      switch (val) {
        case 0:
          return const Color(0xFF6D9BE1);
        case 1:
          return const Color(0xFFBF5E5A);
        case 2:
          return const Color(0xFFA1ABBD);
        case 3:
          return const Color(0xFF699156);
        case 4:
          return const Color(0xFFC58F5E);
        case 5:
          return const Color(0xFFA872B1);
        default:
          return const Color(0xFFFFFFFF);
      }
    }

    String _sizeType(int val) {
      switch (val) {
        case 0:
          return 'M';
        case 1:
          return 'L';
        case 2:
          return 'XL';
        case 3:
          return 'XXL';
        default:
          return 'M';
      }
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Const.radius),
      ),
      margin: const EdgeInsets.only(
        right: Const.space15,
        bottom: 2,
      ),
      child: SizedBox(
        width: 250,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(Const.space8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomNetworkImage(
                    image: product.productImage!,
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(width: Const.space8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          product.productName!,
                          style: theme.textTheme.headline3,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            AutoSizeText(
                              AppLocalizations.of(context)!.color,
                              style: theme.textTheme.subtitle2,
                              maxLines: 1,
                            ),
                            const SizedBox(width: 5),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: _colorType(product.color!),
                            ),
                            const SizedBox(width: Const.space8),
                            AutoSizeText(
                              AppLocalizations.of(context)!.size,
                              style: theme.textTheme.subtitle2,
                              maxLines: 1,
                            ),
                            const SizedBox(width: 5),
                            AutoSizeText(
                              _sizeType(product.size!),
                              style: theme.textTheme.headline4,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        // const SizedBox(width: Const.space8),
                        Row(
                          children: [
                            AutoSizeText(
                              AppLocalizations.of(context)!.qty,
                              style: theme.textTheme.subtitle2,
                              maxLines: 1,
                            ),
                            const SizedBox(width: 5),
                            AutoSizeText(
                              product.qty.toString(),
                              style: theme.textTheme.headline4,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: theme.hintColor),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    AppLocalizations.of(context)!.total,
                    style: theme.textTheme.subtitle1,
                  ),
                  AutoSizeText(
                    NumberFormat.currency(
                    symbol: r'$',
                     decimalDigits: 0,
                    ).format(product.price),
                    style: theme.textTheme.headline3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
