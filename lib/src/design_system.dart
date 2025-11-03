import 'package:flutter/material.dart';

/// Enable Design System
/// 
/// A comprehensive, world-class design system for the Enable travel platform.
/// All design tokens, colors, typography, spacing, and component styles 
/// are defined here for consistency across the entire application.

// ═══════════════════════════════════════════════════════════════════════
// 🎨 COLOR SYSTEM
// ═══════════════════════════════════════════════════════════════════════

class EnableColors {
  // Private constructor to prevent instantiation
  EnableColors._();

  // ─────────────────────────────────────────────────────────────────────
  // PRIMARY COLORS - Main brand colors
  // ─────────────────────────────────────────────────────────────────────
  
  /// Primary background color - Main app background
  static const Color background = Color(0xFF181616);
  
  /// Surface color - Cards, containers
  static const Color surface = Color(0xFF1E1E1E);
  
  /// Surface variant - Hover states, elevated surfaces
  static const Color surfaceVariant = Color(0xFF292525);
  
  /// Primary text color
  static const Color textPrimary = Color(0xFFFFFFFF);
  
  /// Secondary text color
  static const Color textSecondary = Color(0xFF999999);
  
  /// Tertiary text color - Body text
  static const Color textTertiary = Color(0xFFE2DDD3);

  // ─────────────────────────────────────────────────────────────────────
  // ACCENT COLORS
  // ─────────────────────────────────────────────────────────────────────
  
  /// Primary accent - Main interactive elements
  static const Color accentPrimary = Color(0xFFE8DDC4);
  
  /// Accent hover state
  static const Color accentHover = Color(0xFF6a5139);
  
  /// Accent active state
  static const Color accentActive = Color(0xFF574131);

  // ─────────────────────────────────────────────────────────────────────
  // INTERACTIVE COLORS
  // ─────────────────────────────────────────────────────────────────────
  
  /// Border color - Default borders
  static const Color border = Color(0xFFE8DDC4);
  
  /// Border hover
  static const Color borderHover = Color(0xFFFFFFFF);
  
  /// Border disabled
  static const Color borderDisabled = Color(0xFF292525);
  
  /// Divider color
  static const Color divider = Color(0xFF292525);

  // ─────────────────────────────────────────────────────────────────────
  // BUTTON COLORS
  // ─────────────────────────────────────────────────────────────────────
  
  /// Primary button background
  static const Color buttonPrimary = Color(0xFF383232);
  
  /// Primary button hover
  static const Color buttonPrimaryHover = Color(0xFF3a3132);
  
  /// Secondary button background (transparent with border)
  static const Color buttonSecondary = Colors.transparent;
  
  /// Icon color - Default
  static const Color iconDefault = Color(0xFF999999);
  
  /// Icon color - Hover
  static const Color iconHover = Color(0xFFE2DDD3);
  
  /// Icon color - Active/Selected
  static const Color iconActive = Color(0xFFE2DDD3);

  // ─────────────────────────────────────────────────────────────────────
  // SEMANTIC COLORS - Status, feedback
  // ─────────────────────────────────────────────────────────────────────
  
  /// Success color
  static const Color success = Color(0xFF4CAF50);
  
  /// Error color
  static const Color error = Color(0xFFF44336);
  
  /// Warning color
  static const Color warning = Color(0xFFFF9800);
  
  /// Info color
  static const Color info = Color(0xFF2196F3);

  // ─────────────────────────────────────────────────────────────────────
  // OVERLAY COLORS - Modals, backdrops
  // ─────────────────────────────────────────────────────────────────────
  
  /// Overlay background
  static const Color overlay = Color(0xCC000000); // 80% opacity black
  
  /// Modal background
  static const Color modalBackground = Color(0xFF1E1E1E);
  
  /// Selection background
  static const Color selection = Color(0xFF383232);

  // ─────────────────────────────────────────────────────────────────────
  // HELPER METHODS
  // ─────────────────────────────────────────────────────────────────────
  
  /// Get color with opacity
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }
}

// ═══════════════════════════════════════════════════════════════════════
// 📏 SPACING SYSTEM - 8px Grid System
// ═══════════════════════════════════════════════════════════════════════

class EnableSpacing {
  EnableSpacing._();

  // Base unit for spacing calculations
  static const double _baseUnit = 8.0;

  /// 4px - Extra extra small
  static const double xxs = _baseUnit * 0.5; // 4px

  /// 8px - Extra small
  static const double xs = _baseUnit; // 8px

  /// 12px - Small
  static const double sm = _baseUnit * 1.5; // 12px

  /// 16px - Medium (default)
  static const double md = _baseUnit * 2; // 16px

  /// 24px - Large
  static const double lg = _baseUnit * 3; // 24px

  /// 32px - Extra large
  static const double xl = _baseUnit * 4; // 32px

  /// 48px - Extra extra large
  static const double xxl = _baseUnit * 6; // 48px

  /// 64px - Huge
  static const double huge = _baseUnit * 8; // 64px

  // Edge insets helpers
  static const EdgeInsets paddingXXS = EdgeInsets.all(xxs);
  static const EdgeInsets paddingXS = EdgeInsets.all(xs);
  static const EdgeInsets paddingSM = EdgeInsets.all(sm);
  static const EdgeInsets paddingMD = EdgeInsets.all(md);
  static const EdgeInsets paddingLG = EdgeInsets.all(lg);
  static const EdgeInsets paddingXL = EdgeInsets.all(xl);
  static const EdgeInsets paddingXXL = EdgeInsets.all(xxl);

  // Horizontal padding
  static const EdgeInsets horizontalXS = EdgeInsets.symmetric(horizontal: xs);
  static const EdgeInsets horizontalSM = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets horizontalMD = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets horizontalLG = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets horizontalXL = EdgeInsets.symmetric(horizontal: xl);

  // Vertical padding
  static const EdgeInsets verticalXS = EdgeInsets.symmetric(vertical: xs);
  static const EdgeInsets verticalSM = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets verticalMD = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets verticalLG = EdgeInsets.symmetric(vertical: lg);
  static const EdgeInsets verticalXL = EdgeInsets.symmetric(vertical: xl);

  // Gap/spacing for rows and columns
  static const double gapXS = xs;
  static const double gapSM = sm;
  static const double gapMD = md;
  static const double gapLG = lg;
  static const double gapXL = xl;
}

// ═══════════════════════════════════════════════════════════════════════
// 🔤 TYPOGRAPHY SYSTEM
// ═══════════════════════════════════════════════════════════════════════

class EnableTypography {
  EnableTypography._();

  // Font family
  static const String fontFamily = 'LibreFranklin';

  // Font weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  // ─────────────────────────────────────────────────────────────────────
  // DISPLAY STYLES - Large headings, hero text
  // ─────────────────────────────────────────────────────────────────────
  
  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 48,
    fontWeight: bold,
    height: 1.2,
    letterSpacing: -0.5,
    color: EnableColors.textPrimary,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 36,
    fontWeight: bold,
    height: 1.2,
    letterSpacing: -0.5,
    color: EnableColors.textPrimary,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 27,
    fontWeight: regular,
    height: 1.3,
    color: EnableColors.textPrimary,
  );

  // ─────────────────────────────────────────────────────────────────────
  // HEADING STYLES
  // ─────────────────────────────────────────────────────────────────────
  
  static const TextStyle h1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: bold,
    height: 1.3,
    color: EnableColors.textPrimary,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: medium,
    height: 1.4,
    color: EnableColors.textPrimary,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: semiBold,
    height: 1.4,
    color: EnableColors.textPrimary,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: semiBold,
    height: 1.5,
    color: EnableColors.textPrimary,
  );

  static const TextStyle h5 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    fontWeight: bold,
    height: 1.5,
    color: EnableColors.textPrimary,
  );

  // ─────────────────────────────────────────────────────────────────────
  // BODY STYLES - Paragraph text
  // ─────────────────────────────────────────────────────────────────────
  
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    fontWeight: light,
    height: 1.6,
    color: EnableColors.textTertiary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: light,
    height: 1.6,
    color: EnableColors.textTertiary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: light,
    height: 1.6,
    color: EnableColors.textTertiary,
  );

  // ─────────────────────────────────────────────────────────────────────
  // LABEL STYLES - UI labels, buttons, tags
  // ─────────────────────────────────────────────────────────────────────
  
  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: semiBold,
    height: 1.4,
    color: EnableColors.textTertiary,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: regular,
    height: 1.4,
    color: EnableColors.textTertiary,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: semiBold,
    height: 1.4,
    color: EnableColors.textTertiary,
  );

  // ─────────────────────────────────────────────────────────────────────
  // CAPTION & OVERLINE STYLES
  // ─────────────────────────────────────────────────────────────────────
  
  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: regular,
    height: 1.4,
    color: EnableColors.textSecondary,
  );

  static const TextStyle overline = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: semiBold,
    height: 1.4,
    letterSpacing: 0.5,
    color: EnableColors.textSecondary,
  );
}

// ═══════════════════════════════════════════════════════════════════════
// 📐 SIZING & DIMENSIONS
// ═══════════════════════════════════════════════════════════════════════

class EnableSizing {
  EnableSizing._();

  // ─────────────────────────────────────────────────────────────────────
  // BORDER RADIUS - Rounded corners
  // ─────────────────────────────────────────────────────────────────────
  
  /// Small radius - 6px (buttons, small inputs)
  static const double radiusSmall = 6.0;
  
  /// Medium radius - 8px (cards, default elements)
  static const double radiusMedium = 8.0;
  
  /// Large radius - 12px (large cards, modals)
  static const double radiusLarge = 12.0;
  
  /// Extra large radius - 16px (overlays, special elements)
  static const double radiusXLarge = 16.0;
  
  /// Round - 999px (fully rounded)
  static const double radiusRound = 999.0;

  // Border radius objects
  static BorderRadius get borderRadiusSmall => BorderRadius.circular(radiusSmall);
  static BorderRadius get borderRadiusMedium => BorderRadius.circular(radiusMedium);
  static BorderRadius get borderRadiusLarge => BorderRadius.circular(radiusLarge);
  static BorderRadius get borderRadiusXLarge => BorderRadius.circular(radiusXLarge);
  static BorderRadius get borderRadiusRound => BorderRadius.circular(radiusRound);

  // ─────────────────────────────────────────────────────────────────────
  // ICON SIZES
  // ─────────────────────────────────────────────────────────────────────
  
  static const double iconSmall = 16.0;
  static const double iconMedium = 20.0;
  static const double iconLarge = 24.0;
  static const double iconXLarge = 32.0;

  // ─────────────────────────────────────────────────────────────────────
  // BUTTON SIZES
  // ─────────────────────────────────────────────────────────────────────
  
  static const double buttonHeightSmall = 32.0;
  static const double buttonHeightMedium = 40.0;
  static const double buttonHeightLarge = 48.0;

  // ─────────────────────────────────────────────────────────────────────
  // ELEVATION / SHADOWS
  // ─────────────────────────────────────────────────────────────────────
  
  static const double elevationNone = 0.0;
  static const double elevationLow = 2.0;
  static const double elevationMedium = 4.0;
  static const double elevationHigh = 8.0;
  static const double elevationXHigh = 16.0;

  // ─────────────────────────────────────────────────────────────────────
  // APPBAR & TOOLBAR
  // ─────────────────────────────────────────────────────────────────────
  
  static const double appBarHeight = 60.0;
  static const double toolbarHeight = 60.0;

  // ─────────────────────────────────────────────────────────────────────
  // CONTAINER CONSTRAINTS
  // ─────────────────────────────────────────────────────────────────────
  
  static const double contentMaxWidth = 1440.0;
  static const double formMaxWidth = 600.0;
  static const double cardMaxWidth = 400.0;
}

// ═══════════════════════════════════════════════════════════════════════
// 🎭 ANIMATIONS & DURATIONS
// ═══════════════════════════════════════════════════════════════════════

class EnableAnimations {
  EnableAnimations._();

  // Duration constants
  static const Duration instant = Duration(milliseconds: 0);
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 200);
  static const Duration medium = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);

  // Curves
  static const Curve easeIn = Curves.easeIn;
  static const Curve easeOut = Curves.easeOut;
  static const Curve easeInOut = Curves.easeInOut;
  static const Curve spring = Curves.elasticOut;
}

// ═══════════════════════════════════════════════════════════════════════
// 🎨 COMPREHENSIVE THEME DATA
// ═══════════════════════════════════════════════════════════════════════

class EnableTheme {
  static ThemeData get theme {
    final colorScheme = ColorScheme.dark(
      surface: EnableColors.background,
      onSurface: EnableColors.textSecondary,
      primary: EnableColors.textPrimary,
      secondary: EnableColors.textSecondary,
      error: EnableColors.error,
      outline: EnableColors.border,
      outlineVariant: EnableColors.borderDisabled,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: EnableColors.background,
      fontFamily: EnableTypography.fontFamily,
      
      // Remove all splash effects for cleaner UI
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      hoverColor: EnableColors.surfaceVariant,
      
      // Text theme
      textTheme: TextTheme(
        displayLarge: EnableTypography.displayLarge,
        displayMedium: EnableTypography.displayMedium,
        displaySmall: EnableTypography.displaySmall,
        headlineLarge: EnableTypography.h1,
        headlineMedium: EnableTypography.h2,
        headlineSmall: EnableTypography.h3,
        titleLarge: EnableTypography.h4,
        titleMedium: EnableTypography.h5,
        titleSmall: EnableTypography.labelLarge,
        bodyLarge: EnableTypography.bodyLarge,
        bodyMedium: EnableTypography.bodyMedium,
        bodySmall: EnableTypography.bodySmall,
        labelLarge: EnableTypography.labelLarge,
        labelMedium: EnableTypography.labelMedium,
        labelSmall: EnableTypography.labelSmall,
      ),
      
      // App bar theme
      appBarTheme: AppBarTheme(
        backgroundColor: EnableColors.background,
        foregroundColor: EnableColors.textPrimary,
        elevation: 0,
        centerTitle: false,
        toolbarHeight: EnableSizing.appBarHeight,
        titleTextStyle: EnableTypography.h3,
      ),
      
      // Card theme
      cardTheme: CardThemeData(
        color: EnableColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: EnableSizing.borderRadiusMedium,
          side: BorderSide(
            color: EnableColors.borderDisabled,
            width: 1,
          ),
        ),
        margin: EdgeInsets.zero,
      ),
      
      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: false,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(
          horizontal: EnableSpacing.md,
          vertical: EnableSpacing.sm,
        ),
        hintStyle: EnableTypography.bodyMedium.copyWith(
          color: EnableColors.textSecondary,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: EnableColors.border,
            width: 1.5,
          ),
          borderRadius: EnableSizing.borderRadiusSmall,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: EnableColors.borderHover,
            width: 1.5,
          ),
          borderRadius: EnableSizing.borderRadiusSmall,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: EnableColors.borderDisabled,
            width: 1.5,
          ),
          borderRadius: EnableSizing.borderRadiusSmall,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: EnableColors.error,
            width: 1.5,
          ),
          borderRadius: EnableSizing.borderRadiusSmall,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: EnableColors.error,
            width: 2,
          ),
          borderRadius: EnableSizing.borderRadiusSmall,
        ),
      ),
      
      // Icon theme
      iconTheme: IconThemeData(
        color: EnableColors.iconDefault,
        size: EnableSizing.iconMedium,
      ),
      
      // Divider theme
      dividerTheme: DividerThemeData(
        color: EnableColors.divider,
        thickness: 1,
        space: 1,
      ),
    );
  }
}

