import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_bundle/helpers/colors.dart';
import 'package:ultimate_bundle/helpers/constants.dart';
import 'package:ultimate_bundle/providers/theme_provider.dart';
import 'package:ultimate_bundle/src/furney/src/helpers/constants.dart';
import 'package:ultimate_bundle/src/furney/src/helpers/screens.dart';
import 'package:ultimate_bundle/src/furney/src/list_item/address_list.dart';
import 'package:ultimate_bundle/src/furney/src/list_item/credit_card_list.dart';
import 'package:ultimate_bundle/src/furney/src/list_item/payment_list.dart';
import 'package:ultimate_bundle/src/furney/src/widgets/custom_app_bar.dart';
import 'package:ultimate_bundle/src/furney/src/widgets/custom_elevated_button.dart';
import 'package:ultimate_bundle/src/furney/src/widgets/custom_text_form_field.dart';

part 'screens/checkout_screen.dart';
part 'screens/checkout_success_screen.dart';
part 'widgets/address_section.dart';
part 'widgets/build_checkout_list_tile.dart';
part 'widgets/build_destination_address.dart';
part 'widgets/build_payment_card.dart';
part 'widgets/build_promo_code_card.dart';
part 'widgets/confirmation_footer_section.dart';
part 'widgets/confirmation_section.dart';
part 'widgets/payment_section.dart';
