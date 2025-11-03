import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../design_system.dart';

/// Enable App Bar
/// 
/// A standardized, consistent app bar used across all screens in the application.
/// Provides unified navigation, search, and actions.
///
/// Features:
/// - Consistent height (60px)
/// - Home navigation icon
/// - Optional search bar
/// - Action buttons
/// - Responsive design

class EnableAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Title widget (usually Text)
  final Widget? title;
  
  /// Show search bar instead of title
  final bool showSearch;
  
  /// Search controller (required if showSearch is true)
  final TextEditingController? searchController;
  
  /// Search hint text
  final String searchHint;
  
  /// Search callback
  final ValueChanged<String>? onSearchChanged;
  
  /// Action buttons on the right
  final List<Widget>? actions;
  
  /// Show home/back button
  final bool showLeading;
  
  /// Custom leading widget (overrides default home button)
  final Widget? leading;
  
  /// Background color (defaults to theme background)
  final Color? backgroundColor;
  
  /// Elevation (defaults to 0)
  final double elevation;
  
  /// Center title
  final bool centerTitle;

  const EnableAppBar({
    super.key,
    this.title,
    this.showSearch = false,
    this.searchController,
    this.searchHint = 'Search...',
    this.onSearchChanged,
    this.actions,
    this.showLeading = true,
    this.leading,
    this.backgroundColor,
    this.elevation = 0,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: showLeading ? (leading ?? _buildHomeButton(context)) : null,
      title: showSearch ? _buildSearchBar(context) : title,
      centerTitle: centerTitle,
      actions: actions,
      backgroundColor: backgroundColor ?? EnableColors.background,
      foregroundColor: EnableColors.textPrimary,
      elevation: elevation,
      toolbarHeight: EnableSizing.appBarHeight,
      surfaceTintColor: Colors.transparent,
    );
  }

  Widget _buildHomeButton(BuildContext context) {
    return _HoverableHomeButton(
      onTap: () {
        // Try to go back first, if not possible go to home
        if (GoRouter.of(context).canPop()) {
          context.pop();
        } else {
          context.go('/home');
        }
      },
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: TextField(
        controller: searchController,
        style: EnableTypography.bodyMedium,
        decoration: InputDecoration(
          hintText: searchHint,
          hintStyle: EnableTypography.bodyMedium.copyWith(
            color: EnableColors.textSecondary,
          ),
          suffixIcon: Icon(
            Icons.search,
            size: EnableSizing.iconMedium,
            color: EnableColors.iconDefault,
          ),
          contentPadding: EnableSpacing.horizontalMD.copyWith(
            top: EnableSpacing.sm,
            bottom: EnableSpacing.sm,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: EnableSizing.borderRadiusMedium,
            borderSide: BorderSide(
              color: EnableColors.borderDisabled,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: EnableSizing.borderRadiusMedium,
            borderSide: BorderSide(
              color: EnableColors.border,
              width: 1.5,
            ),
          ),
        ),
        onChanged: onSearchChanged,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(EnableSizing.appBarHeight);
}

/// Hoverable Home Button
/// Internal widget for consistent home button behavior
class _HoverableHomeButton extends StatefulWidget {
  final VoidCallback onTap;

  const _HoverableHomeButton({required this.onTap});

  @override
  State<_HoverableHomeButton> createState() => _HoverableHomeButtonState();
}

class _HoverableHomeButtonState extends State<_HoverableHomeButton> {
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
          margin: EdgeInsets.all(EnableSpacing.xs),
          decoration: BoxDecoration(
            color: _isHovered 
                ? EnableColors.surfaceVariant 
                : Colors.transparent,
            borderRadius: EnableSizing.borderRadiusSmall,
          ),
          child: Icon(
            Icons.home_outlined,
            size: EnableSizing.iconLarge,
            color: _isHovered 
                ? EnableColors.iconHover 
                : EnableColors.iconDefault,
          ),
        ),
      ),
    );
  }
}

/// Action Button for AppBar
/// Standardized button for app bar actions
class AppBarAction extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  final String? tooltip;
  final bool isActive;

  const AppBarAction({
    super.key,
    required this.icon,
    required this.onTap,
    this.tooltip,
    this.isActive = false,
  });

  @override
  State<AppBarAction> createState() => _AppBarActionState();
}

class _AppBarActionState extends State<AppBarAction> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final child = MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: EnableSpacing.xxs),
          padding: EdgeInsets.all(EnableSpacing.sm),
          decoration: BoxDecoration(
            color: _isHovered || widget.isActive
                ? EnableColors.surfaceVariant
                : Colors.transparent,
            borderRadius: EnableSizing.borderRadiusSmall,
          ),
          child: Icon(
            widget.icon,
            size: EnableSizing.iconMedium,
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
        child: child,
      );
    }

    return child;
  }
}

