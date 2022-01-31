import 'dart:ui';

import 'package:flutter/material.dart';

class Typography {
  const Typography();

  static const String fontFamilyLight = 'Roboto Light';
  static const String fontFamilyRegular = 'Roboto Regular';
  static const String fontFamilyBold = 'Roboto Bold';

  TextStyle get title1 => const TextStyle(
        height: 1.12,
        fontSize: 48,
        fontWeight: FontWeight.w500,
        fontFeatures: <FontFeature>[FontFeature.disable('ss01')],
        fontFamily: fontFamilyRegular,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get title2 => const TextStyle(
        height: 1.17,
        fontSize: 34,
        fontWeight: FontWeight.w500,
        fontFeatures: <FontFeature>[FontFeature.disable('ss01')],
        fontFamily: fontFamilyRegular,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get title3 => const TextStyle(
        height: 1.33,
        fontSize: 24,
        fontWeight: FontWeight.w500,
        fontFeatures: <FontFeature>[FontFeature.disable('ss01')],
        fontFamily: fontFamilyRegular,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get title4 => const TextStyle(
        height: 1.3,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFeatures: <FontFeature>[FontFeature.disable('ss01')],
        fontFamily: fontFamilyRegular,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get body => const TextStyle(
        height: 1.5,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFeatures: <FontFeature>[],
        fontFamily: fontFamilyRegular,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get button => const TextStyle(
        height: 1.5,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFeatures: <FontFeature>[],
        fontFamily: fontFamilyRegular,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get label => const TextStyle(
        height: 1.5,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFeatures: <FontFeature>[],
        fontFamily: fontFamilyRegular,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get caption => const TextStyle(
        height: 1.5,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFeatures: <FontFeature>[],
        fontFamily: fontFamilyLight,
        leadingDistribution: TextLeadingDistribution.even,
      );
}
