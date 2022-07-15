// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return LightModeTheme();
  }

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;
  Color alternate;
  Color primaryBackground;
  Color secondaryBackground;
  Color primaryText;
  Color secondaryText;

  Color pLight;
  Color sLight;
  Color tLight;
  Color pDark;
  Color sDark;
  Color tDark;
  Color textDark;
  Color textLight;
  Color background;
  Color stripeBack;
  Color stripeBox;
  Color stripeBorder;
  Color stripeSelected;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFF2979FF);
  Color secondaryColor = const Color(0xFF212121);
  Color tertiaryColor = const Color(0xFFEEEEEE);
  Color alternate = const Color(0x00000000);
  Color primaryBackground = const Color(0x00000000);
  Color secondaryBackground = const Color(0x00000000);
  Color primaryText = const Color(0x00000000);
  Color secondaryText = const Color(0x00000000);

  Color pLight = Color(0xFF75A7FF);
  Color sLight = Color(0xFF484848);
  Color tLight = Color(0xFFFAFAFA);
  Color pDark = Color(0xFF004ECB);
  Color sDark = Color(0xFF000000);
  Color tDark = Color(0xFFE0E0E0);
  Color textDark = Color(0xFF000000);
  Color textLight = Color(0xFFFFFFFF);
  Color background = Color(0xFFFFFFFF);
  Color stripeBack = Color(0xFF1A1F36);
  Color stripeBox = Color(0xFF30313D);
  Color stripeBorder = Color(0xFF424353);
  Color stripeSelected = Color(0xFF85D996);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get title3Family;
  TextStyle get title3;
  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;
  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Open Sans';
  TextStyle get title1 => GoogleFonts.getFont(
        'Open Sans',
        color: theme.secondaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      );
  String get title2Family => 'Open Sans';
  TextStyle get title2 => GoogleFonts.getFont(
        'Open Sans',
        color: theme.secondaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 22,
      );
  String get title3Family => 'Open Sans';
  TextStyle get title3 => GoogleFonts.getFont(
        'Open Sans',
        color: theme.secondaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      );
  String get subtitle1Family => 'Open Sans';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Open Sans',
        color: theme.secondaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  String get subtitle2Family => 'Open Sans';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Open Sans',
        color: theme.secondaryColor,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  String get bodyText1Family => 'Open Sans';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Open Sans',
        color: theme.secondaryColor,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  String get bodyText2Family => 'Open Sans';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Open Sans',
        color: theme.secondaryColor,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    double letterSpacing,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    TextDecoration decoration,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
