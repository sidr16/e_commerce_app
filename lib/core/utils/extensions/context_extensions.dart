import 'package:flutter/material.dart';

import '../../widgets/snack_bar/app_snack_bar.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  AppSnackBar get snackBar => AppSnackBar(this);
}
