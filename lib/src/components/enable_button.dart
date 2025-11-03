import 'package:flutter/material.dart';
import '../design_system.dart';

/// Enable Button
/// 
/// Standardized button component with three variants:
/// - Primary: Filled button for main actions
/// - Secondary: Outlined button for secondary actions  
/// - Tertiary: Text-only button for less emphasis
///
/// Features:
/// - Consistent sizing (small, medium, large)
/// - Hover states
/// - Loading states
/// - Icon support
/// - Disabled states

enum EnableButtonVariant {
  primary,
  secondary,
  tertiary,
}

enum EnableButtonSize {
  small,
  medium,
  large,
}

class EnableButton extends StatefulWidget {
  /// Button label
  final String label;
  
  /// On pressed callback
  final VoidCallback? onPressed;
  
  /// Button variant
  final EnableButtonVariant variant;
  
  /// Button size
  final EnableButtonSize size;
  
  /// Leading icon
  final IconData? leadingIcon;
  
  /// Trailing icon
  final IconData? trailingIcon;
  
  /// Show loading indicator
  final bool isLoading;
  
  /// Expand to full width
  final bool fullWidth;
  
  /// Custom width
  final double? width;

  const EnableButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = EnableButtonVariant.primary,
    this.size = EnableButtonSize.medium,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.fullWidth = false,
    this.width,
  });

  /// Quick constructor for primary button
  const EnableButton.primary({
    super.key,
    required this.label,
    required this.onPressed,
    this.size = EnableButtonSize.medium,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.fullWidth = false,
    this.width,
  }) : variant = EnableButtonVariant.primary;

  /// Quick constructor for secondary button
  const EnableButton.secondary({
    super.key,
    required this.label,
    required this.onPressed,
    this.size = EnableButtonSize.medium,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.fullWidth = false,
    this.width,
  }) : variant = EnableButtonVariant.secondary;

  /// Quick constructor for tertiary button
  const EnableButton.tertiary({
    super.key,
    required this.label,
    required this.onPressed,
    this.size = EnableButtonSize.medium,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.fullWidth = false,
    this.width,
  }) : variant = EnableButtonVariant.tertiary;

  @override
  State<EnableButton> createState() => _EnableButtonState();
}

class _EnableButtonState extends State<EnableButton> {
  bool _isHovered = false;

  double _getHeight() {
    switch (widget.size) {
      case EnableButtonSize.small:
        return EnableSizing.buttonHeightSmall;
      case EnableButtonSize.medium:
        return EnableSizing.buttonHeightMedium;
      case EnableButtonSize.large:
        return EnableSizing.buttonHeightLarge;
    }
  }

  EdgeInsets _getPadding() {
    switch (widget.size) {
      case EnableButtonSize.small:
        return EdgeInsets.symmetric(
          horizontal: EnableSpacing.sm,
          vertical: EnableSpacing.xxs,
        );
      case EnableButtonSize.medium:
        return EdgeInsets.symmetric(
          horizontal: EnableSpacing.md,
          vertical: EnableSpacing.xs,
        );
      case EnableButtonSize.large:
        return EdgeInsets.symmetric(
          horizontal: EnableSpacing.lg,
          vertical: EnableSpacing.sm,
        );
    }
  }

  TextStyle _getTextStyle() {
    final baseStyle = widget.size == EnableButtonSize.small
        ? EnableTypography.labelSmall
        : widget.size == EnableButtonSize.medium
            ? EnableTypography.labelMedium
            : EnableTypography.labelLarge;

    Color textColor;
    switch (widget.variant) {
      case EnableButtonVariant.primary:
        textColor = EnableColors.textPrimary;
        break;
      case EnableButtonVariant.secondary:
        textColor = _isHovered 
            ? EnableColors.textPrimary 
            : EnableColors.textTertiary;
        break;
      case EnableButtonVariant.tertiary:
        textColor = _isHovered 
            ? EnableColors.textPrimary 
            : EnableColors.textTertiary;
        break;
    }

    return baseStyle.copyWith(
      color: widget.onPressed == null && !widget.isLoading
          ? EnableColors.textSecondary
          : textColor,
    );
  }

  Color _getBackgroundColor() {
    if (widget.onPressed == null && !widget.isLoading) {
      return EnableColors.borderDisabled;
    }

    switch (widget.variant) {
      case EnableButtonVariant.primary:
        return _isHovered
            ? EnableColors.buttonPrimaryHover
            : EnableColors.buttonPrimary;
      case EnableButtonVariant.secondary:
      case EnableButtonVariant.tertiary:
        return _isHovered 
            ? EnableColors.surfaceVariant 
            : Colors.transparent;
    }
  }

  BoxBorder? _getBorder() {
    switch (widget.variant) {
      case EnableButtonVariant.secondary:
        return Border.all(
          color: widget.onPressed == null && !widget.isLoading
              ? EnableColors.borderDisabled
              : (_isHovered ? EnableColors.border : EnableColors.borderDisabled),
          width: 1.5,
        );
      case EnableButtonVariant.primary:
      case EnableButtonVariant.tertiary:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = Row(
      mainAxisSize: widget.fullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.isLoading) ...[
          SizedBox(
            width: EnableSizing.iconSmall,
            height: EnableSizing.iconSmall,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                widget.variant == EnableButtonVariant.primary
                    ? EnableColors.textPrimary
                    : EnableColors.textTertiary,
              ),
            ),
          ),
          SizedBox(width: EnableSpacing.xs),
        ] else if (widget.leadingIcon != null) ...[
          Icon(
            widget.leadingIcon,
            size: widget.size == EnableButtonSize.small 
                ? EnableSizing.iconSmall 
                : EnableSizing.iconMedium,
            color: _getTextStyle().color,
          ),
          SizedBox(width: EnableSpacing.xs),
        ],
        
        Text(
          widget.label,
          style: _getTextStyle(),
        ),
        
        if (widget.trailingIcon != null) ...[
          SizedBox(width: EnableSpacing.xs),
          Icon(
            widget.trailingIcon,
            size: widget.size == EnableButtonSize.small 
                ? EnableSizing.iconSmall 
                : EnableSizing.iconMedium,
            color: _getTextStyle().color,
          ),
        ],
      ],
    );

    return MouseRegion(
      cursor: widget.onPressed != null && !widget.isLoading
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) {
        if (widget.onPressed != null && !widget.isLoading) {
          setState(() => _isHovered = true);
        }
      },
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed != null && !widget.isLoading 
            ? widget.onPressed 
            : null,
        child: AnimatedContainer(
          duration: EnableAnimations.fast,
          curve: EnableAnimations.easeOut,
          width: widget.fullWidth ? double.infinity : widget.width,
          height: _getHeight(),
          padding: _getPadding(),
          decoration: BoxDecoration(
            color: _getBackgroundColor(),
            border: _getBorder(),
            borderRadius: EnableSizing.borderRadiusSmall,
          ),
          child: content,
        ),
      ),
    );
  }
}

/// Icon Button
/// 
/// A simple icon-only button with hover states
class EnableIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final bool isActive;
  final EnableButtonSize size;

  const EnableIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.isActive = false,
    this.size = EnableButtonSize.medium,
  });

  @override
  State<EnableIconButton> createState() => _EnableIconButtonState();
}

class _EnableIconButtonState extends State<EnableIconButton> {
  bool _isHovered = false;

  double _getSize() {
    switch (widget.size) {
      case EnableButtonSize.small:
        return 32;
      case EnableButtonSize.medium:
        return 40;
      case EnableButtonSize.large:
        return 48;
    }
  }

  double _getIconSize() {
    switch (widget.size) {
      case EnableButtonSize.small:
        return EnableSizing.iconSmall;
      case EnableButtonSize.medium:
        return EnableSizing.iconMedium;
      case EnableButtonSize.large:
        return EnableSizing.iconLarge;
    }
  }

  @override
  Widget build(BuildContext context) {
    final button = MouseRegion(
      cursor: widget.onPressed != null 
          ? SystemMouseCursors.click 
          : SystemMouseCursors.basic,
      onEnter: (_) {
        if (widget.onPressed != null) {
          setState(() => _isHovered = true);
        }
      },
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: EnableAnimations.fast,
          width: _getSize(),
          height: _getSize(),
          decoration: BoxDecoration(
            color: _isHovered || widget.isActive
                ? EnableColors.surfaceVariant
                : Colors.transparent,
            border: widget.isActive
                ? Border.all(
                    color: EnableColors.borderDisabled,
                    width: 1,
                  )
                : null,
            borderRadius: EnableSizing.borderRadiusSmall,
          ),
          child: Icon(
            widget.icon,
            size: _getIconSize(),
            color: _isHovered || widget.isActive
                ? EnableColors.iconHover
                : EnableColors.iconDefault,
          ),
        ),
      ),
    );

    if (widget.tooltip != null) {
      return Tooltip(
        message: widget.tooltip!,
        child: button,
      );
    }

    return button;
  }
}

/// Floating Action Button
/// 
/// A circular button for primary actions
class EnableFAB extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String? label;
  final bool isExtended;

  const EnableFAB({
    super.key,
    required this.icon,
    required this.onPressed,
    this.label,
    this.isExtended = false,
  });

  @override
  State<EnableFAB> createState() => _EnableFABState();
}

class _EnableFABState extends State<EnableFAB> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: EnableAnimations.fast,
          padding: widget.isExtended
              ? EdgeInsets.symmetric(
                  horizontal: EnableSpacing.lg,
                  vertical: EnableSpacing.md,
                )
              : EdgeInsets.all(EnableSpacing.md),
          decoration: BoxDecoration(
            color: _isHovered
                ? EnableColors.buttonPrimaryHover
                : EnableColors.buttonPrimary,
            borderRadius: BorderRadius.circular(
              widget.isExtended ? EnableSizing.radiusLarge : EnableSizing.radiusRound,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: _isHovered ? 12 : 8,
                offset: Offset(0, _isHovered ? 6 : 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: EnableSizing.iconLarge,
                color: EnableColors.textPrimary,
              ),
              if (widget.isExtended && widget.label != null) ...[
                SizedBox(width: EnableSpacing.sm),
                Text(
                  widget.label!,
                  style: EnableTypography.labelLarge.copyWith(
                    color: EnableColors.textPrimary,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

