import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_bundle/helpers/constants.dart';
import 'package:ultimate_bundle/providers/locale_provider.dart';
import 'package:ultimate_bundle/providers/theme_provider.dart';

import 'package:ultimate_bundle/src/shuppy/src/helpers/colors.dart';
import 'package:ultimate_bundle/src/shuppy/src/helpers/constants.dart';
import 'package:ultimate_bundle/src/shuppy/src/helpers/dialogs.dart';
import 'package:ultimate_bundle/src/shuppy/src/helpers/snack_toast.dart';
import 'package:ultimate_bundle/src/shuppy/src/models/user_model.dart';
import 'package:ultimate_bundle/src/shuppy/src/widgets/custom_app_bar.dart';
import 'package:ultimate_bundle/src/shuppy/src/widgets/custom_fade_transtition.dart';
import 'package:ultimate_bundle/src/shuppy/src/widgets/custom_shake_transtition.dart';
import 'package:ultimate_bundle/src/shuppy/src/widgets/custom_text_button.dart';
import 'package:ultimate_bundle/src/shuppy/src/widgets/custom_text_form_field.dart';

part 'screens/edit_profile_screen.dart';
part 'screens/profile_screen.dart';
part 'widgets/body_section.dart';
part 'widgets/build_change_photo_profile.dart';
part 'widgets/build_form_edit_profile.dart';
part 'widgets/header_section.dart';
