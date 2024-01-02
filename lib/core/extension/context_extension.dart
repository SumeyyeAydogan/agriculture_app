import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
  double get extraLowValue => height * 0.005;
  double get lowValue => height * 0.01;
  double get normalValue => height * 0.05;
  double get mediumValue => height * 0.02;
  double get mediumLowValue => height * 0.015;
  double get highValue => height * 0.1;
  double get extraHighValue => height * 0.15;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
  IconThemeData get iconTheme => theme.iconTheme;
  IconThemeData get iconPrimaryTheme => theme.primaryIconTheme;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingExtraLow => EdgeInsets.all(extraLowValue);
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension PaddingExtensionSymmetric on BuildContext {
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(
        vertical: lowValue,
      );
  EdgeInsets get paddingNormalVertical =>
      EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingMediumVertical =>
      EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingMediumLowVertical =>
      EdgeInsets.symmetric(vertical: mediumLowValue);
  EdgeInsets get paddingHighVertical =>
      EdgeInsets.symmetric(vertical: highValue);
  EdgeInsets get paddingExtraHighVertical =>
      EdgeInsets.symmetric(vertical: extraHighValue);
  EdgeInsets get paddingBottomMedium => EdgeInsets.only(bottom: mediumValue);
  EdgeInsets get paddingHighVerticalAndHorizontal =>
      EdgeInsets.symmetric(vertical: mediumValue, horizontal: mediumValue * 2);

  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingNormalHorizontal =>
      EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingHighHorizontal =>
      EdgeInsets.symmetric(horizontal: highValue);
}

extension PaddingExtensionOnly on BuildContext {
  EdgeInsets get paddingTopKeyboard =>
      EdgeInsets.only(bottom: mediaQuery.viewInsets.bottom);
}

extension SizeExtension on BuildContext {
  Size get mediumSize => const Size(300, 45);
}
