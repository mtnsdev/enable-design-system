import 'package:flutter/material.dart';
import '../design_system.dart';

/// Enable Card
/// 
/// A standardized card component with consistent styling and hover states.
/// Use this for all card-based UI elements across the application.
///
/// Features:
/// - Consistent padding and border radius
/// - Hover state animation
/// - Optional click handler
/// - Multiple variants (default, elevated, outlined)
/// - Customizable padding

enum EnableCardVariant {
  /// Default card - subtle border
  default_,
  
  /// Elevated card - with shadow
  elevated,
  
  /// Outlined card - prominent border
  outlined,
  
  /// Transparent card - no background
  transparent,
}

class EnableCard extends StatefulWidget {
  /// Card content
  final Widget child;
  
  /// On tap callback (makes card interactive)
  final VoidCallback? onTap;
  
  /// Card variant
  final EnableCardVariant variant;
  
  /// Custom padding (defaults to md)
  final EdgeInsets? padding;
  
  /// Custom margin
  final EdgeInsets? margin;
  
  /// Show hover effect
  final bool enableHover;
  
  /// Custom background color
  final Color? backgroundColor;
  
  /// Border radius
  final BorderRadius? borderRadius;
  
  /// Width
  final double? width;
  
  /// Height
  final double? height;

  const EnableCard({
    super.key,
    required this.child,
    this.onTap,
    this.variant = EnableCardVariant.default_,
    this.padding,
    this.margin,
    this.enableHover = true,
    this.backgroundColor,
    this.borderRadius,
    this.width,
    this.height,
  });

  /// Quick constructor for clickable cards
  const EnableCard.clickable({
    super.key,
    required this.child,
    required this.onTap,
    this.variant = EnableCardVariant.default_,
    this.padding,
    this.margin,
    this.enableHover = true,
    this.backgroundColor,
    this.borderRadius,
    this.width,
    this.height,
  });

  /// Quick constructor for elevated cards
  const EnableCard.elevated({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.margin,
    this.enableHover = true,
    this.backgroundColor,
    this.borderRadius,
    this.width,
    this.height,
  }) : variant = EnableCardVariant.elevated;

  @override
  State<EnableCard> createState() => _EnableCardState();
}

class _EnableCardState extends State<EnableCard> 
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: EnableAnimations.fast,
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.02,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: EnableAnimations.easeOut,
    ));
    
    _elevationAnimation = Tween<double>(
      begin: _getDefaultElevation(),
      end: _getHoverElevation(),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: EnableAnimations.easeOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  double _getDefaultElevation() {
    switch (widget.variant) {
      case EnableCardVariant.elevated:
        return EnableSizing.elevationLow;
      default:
        return EnableSizing.elevationNone;
    }
  }

  double _getHoverElevation() {
    switch (widget.variant) {
      case EnableCardVariant.elevated:
        return EnableSizing.elevationMedium;
      case EnableCardVariant.default_:
        return EnableSizing.elevationLow;
      default:
        return EnableSizing.elevationNone;
    }
  }

  Color _getBackgroundColor() {
    if (widget.backgroundColor != null) return widget.backgroundColor!;
    
    switch (widget.variant) {
      case EnableCardVariant.transparent:
        return Colors.transparent;
      default:
        return EnableColors.surface;
    }
  }

  BoxBorder? _getBorder() {
    switch (widget.variant) {
      case EnableCardVariant.outlined:
        return Border.all(
          color: _isHovered ? EnableColors.border : EnableColors.borderDisabled,
          width: 1.5,
        );
      case EnableCardVariant.default_:
        return Border.all(
          color: EnableColors.borderDisabled,
          width: 1,
        );
      case EnableCardVariant.transparent:
        return null;
      default:
        return null;
    }
  }

  void _handleHoverEnter(PointerEvent event) {
    if (widget.enableHover && widget.onTap != null) {
      setState(() => _isHovered = true);
      _animationController.forward();
    }
  }

  void _handleHoverExit(PointerEvent event) {
    if (widget.enableHover) {
      setState(() => _isHovered = false);
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final card = AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: widget.enableHover && widget.onTap != null 
              ? _scaleAnimation.value 
              : 1.0,
          child: Container(
            width: widget.width,
            height: widget.height,
            margin: widget.margin,
            padding: widget.padding ?? EnableSpacing.paddingMD,
            decoration: BoxDecoration(
              color: _getBackgroundColor(),
              borderRadius: widget.borderRadius ?? EnableSizing.borderRadiusMedium,
              border: _getBorder(),
              boxShadow: widget.variant == EnableCardVariant.elevated
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: _elevationAnimation.value,
                        offset: Offset(0, _elevationAnimation.value / 2),
                      ),
                    ]
                  : null,
            ),
            child: child,
          ),
        );
      },
      child: widget.child,
    );

    if (widget.onTap != null) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: _handleHoverEnter,
        onExit: _handleHoverExit,
        child: GestureDetector(
          onTap: widget.onTap,
          child: card,
        ),
      );
    }

    if (widget.enableHover) {
      return MouseRegion(
        onEnter: _handleHoverEnter,
        onExit: _handleHoverExit,
        child: card,
      );
    }

    return card;
  }
}

/// Product Card - Specialized card for product listings
class ProductCard extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final String? subtitle;
  final String? category;
  final VoidCallback? onTap;
  final Widget? trailing;
  final bool showBookmark;
  final VoidCallback? onBookmarkTap;
  final bool isBookmarked;

  const ProductCard({
    super.key,
    this.imageUrl,
    required this.title,
    this.subtitle,
    this.category,
    this.onTap,
    this.trailing,
    this.showBookmark = false,
    this.onBookmarkTap,
    this.isBookmarked = false,
  });

  @override
  Widget build(BuildContext context) {
    return EnableCard.clickable(
      onTap: onTap,
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image
          if (imageUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(EnableSizing.radiusMedium),
              ),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: EnableColors.surfaceVariant,
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        size: EnableSizing.iconXLarge,
                        color: EnableColors.iconDefault,
                      ),
                    );
                  },
                ),
              ),
            ),
          
          // Content
          Padding(
            padding: EnableSpacing.paddingMD,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category tag
                if (category != null) ...[
                  _CategoryTag(label: category!),
                  SizedBox(height: EnableSpacing.xs),
                ],
                
                // Title
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: EnableTypography.h4,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (showBookmark) ...[
                      SizedBox(width: EnableSpacing.xs),
                      _BookmarkButton(
                        isBookmarked: isBookmarked,
                        onTap: onBookmarkTap,
                      ),
                    ],
                  ],
                ),
                
                // Subtitle
                if (subtitle != null) ...[
                  SizedBox(height: EnableSpacing.xxs),
                  Text(
                    subtitle!,
                    style: EnableTypography.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                
                // Trailing widget
                if (trailing != null) ...[
                  SizedBox(height: EnableSpacing.sm),
                  trailing!,
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Category Tag
class _CategoryTag extends StatelessWidget {
  final String label;

  const _CategoryTag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: EnableSpacing.xs,
        vertical: EnableSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: EnableColors.surfaceVariant,
        borderRadius: EnableSizing.borderRadiusSmall,
      ),
      child: Text(
        label.toUpperCase(),
        style: EnableTypography.labelSmall.copyWith(
          color: EnableColors.textSecondary,
        ),
      ),
    );
  }
}

/// Bookmark Button
class _BookmarkButton extends StatefulWidget {
  final bool isBookmarked;
  final VoidCallback? onTap;

  const _BookmarkButton({
    required this.isBookmarked,
    this.onTap,
  });

  @override
  State<_BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<_BookmarkButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.all(EnableSpacing.xxs),
          decoration: BoxDecoration(
            color: _isHovered 
                ? EnableColors.surfaceVariant 
                : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(
            widget.isBookmarked 
                ? Icons.bookmark 
                : Icons.bookmark_border,
            size: EnableSizing.iconMedium,
            color: widget.isBookmarked
                ? EnableColors.accentPrimary
                : EnableColors.iconDefault,
          ),
        ),
      ),
    );
  }
}

