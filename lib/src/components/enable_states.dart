import 'package:flutter/material.dart';
import '../design_system.dart';
import 'enable_button.dart';

/// Enable State Widgets
/// 
/// Standardized loading, empty, and error state components
/// for consistent UI feedback across the application.

// ═══════════════════════════════════════════════════════════════════════
// LOADING STATE
// ═══════════════════════════════════════════════════════════════════════

/// Loading State Widget
/// 
/// Shows a centered loading indicator with optional message
class EnableLoadingState extends StatelessWidget {
  final String? message;
  final double? size;

  const EnableLoadingState({
    super.key,
    this.message,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: size ?? 40,
            height: size ?? 40,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(
                EnableColors.textTertiary,
              ),
            ),
          ),
          if (message != null) ...[
            SizedBox(height: EnableSpacing.md),
            Text(
              message!,
              style: EnableTypography.bodyMedium.copyWith(
                color: EnableColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}

/// Inline Loading Indicator
/// 
/// Smaller loading indicator for inline use
class EnableLoadingIndicator extends StatelessWidget {
  final double size;
  final Color? color;

  const EnableLoadingIndicator({
    super.key,
    this.size = 20,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? EnableColors.textTertiary,
        ),
      ),
    );
  }
}

/// Skeleton Loader
/// 
/// Shimmer effect for content placeholders
class EnableSkeleton extends StatefulWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  const EnableSkeleton({
    super.key,
    this.width,
    this.height = 20,
    this.borderRadius,
  });

  @override
  State<EnableSkeleton> createState() => _EnableSkeletonState();
}

class _EnableSkeletonState extends State<EnableSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius ?? EnableSizing.borderRadiusSmall,
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                EnableColors.surfaceVariant,
                EnableColors.surface,
                EnableColors.surfaceVariant,
              ],
              stops: [
                _animation.value - 0.3,
                _animation.value,
                _animation.value + 0.3,
              ],
            ),
          ),
        );
      },
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// EMPTY STATE
// ═══════════════════════════════════════════════════════════════════════

/// Empty State Widget
/// 
/// Shows when there's no data to display
class EnableEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? description;
  final String? actionLabel;
  final VoidCallback? onAction;

  const EnableEmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.description,
    this.actionLabel,
    this.onAction,
  });

  /// Quick constructor for "no results" state
  const EnableEmptyState.noResults({
    super.key,
    this.description = 'Try adjusting your search or filters',
    this.actionLabel,
    this.onAction,
  })  : icon = Icons.search_off,
        title = 'No results found';

  /// Quick constructor for "no data" state
  const EnableEmptyState.noData({
    super.key,
    required String dataType,
    this.description,
    this.actionLabel,
    this.onAction,
  })  : icon = Icons.inbox_outlined,
        title = 'No $dataType yet';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: EnableSpacing.paddingXL,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: EnableColors.surfaceVariant,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 40,
                color: EnableColors.iconDefault,
              ),
            ),
            
            SizedBox(height: EnableSpacing.lg),
            
            // Title
            Text(
              title,
              style: EnableTypography.h3,
              textAlign: TextAlign.center,
            ),
            
            // Description
            if (description != null) ...[
              SizedBox(height: EnableSpacing.sm),
              Text(
                description!,
                style: EnableTypography.bodyMedium.copyWith(
                  color: EnableColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            
            // Action button
            if (actionLabel != null && onAction != null) ...[
              SizedBox(height: EnableSpacing.lg),
              EnableButton.primary(
                label: actionLabel!,
                onPressed: onAction,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// ERROR STATE
// ═══════════════════════════════════════════════════════════════════════

/// Error State Widget
/// 
/// Shows when an error occurs
class EnableErrorState extends StatelessWidget {
  final String title;
  final String? message;
  final String? errorDetails;
  final String? actionLabel;
  final VoidCallback? onAction;
  final bool showErrorDetails;

  const EnableErrorState({
    super.key,
    this.title = 'Something went wrong',
    this.message,
    this.errorDetails,
    this.actionLabel = 'Retry',
    this.onAction,
    this.showErrorDetails = false,
  });

  /// Quick constructor for network errors
  const EnableErrorState.network({
    super.key,
    this.title = 'Connection Error',
    this.message = 'Unable to connect to the server. Please check your internet connection.',
    this.errorDetails,
    this.actionLabel = 'Retry',
    this.onAction,
    this.showErrorDetails = false,
  });

  /// Quick constructor for not found errors
  const EnableErrorState.notFound({
    super.key,
    this.title = 'Not Found',
    this.message = 'The item you\'re looking for doesn\'t exist or has been removed.',
    this.errorDetails,
    this.actionLabel = 'Go Back',
    this.onAction,
    this.showErrorDetails = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        padding: EnableSpacing.paddingXL,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Error Icon
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: EnableColors.error.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline,
                size: 40,
                color: EnableColors.error,
              ),
            ),
            
            SizedBox(height: EnableSpacing.lg),
            
            // Title
            Text(
              title,
              style: EnableTypography.h3,
              textAlign: TextAlign.center,
            ),
            
            // Message
            if (message != null) ...[
              SizedBox(height: EnableSpacing.sm),
              Text(
                message!,
                style: EnableTypography.bodyMedium.copyWith(
                  color: EnableColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            
            // Error details (expandable)
            if (showErrorDetails && errorDetails != null) ...[
              SizedBox(height: EnableSpacing.md),
              _ErrorDetailsExpander(errorDetails: errorDetails!),
            ],
            
            // Action button
            if (actionLabel != null && onAction != null) ...[
              SizedBox(height: EnableSpacing.lg),
              EnableButton.primary(
                label: actionLabel!,
                onPressed: onAction,
                leadingIcon: Icons.refresh,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Error Details Expander
class _ErrorDetailsExpander extends StatefulWidget {
  final String errorDetails;

  const _ErrorDetailsExpander({required this.errorDetails});

  @override
  State<_ErrorDetailsExpander> createState() => _ErrorDetailsExpanderState();
}

class _ErrorDetailsExpanderState extends State<_ErrorDetailsExpander> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EnableButton.tertiary(
          label: _isExpanded ? 'Hide Details' : 'Show Details',
          onPressed: () => setState(() => _isExpanded = !_isExpanded),
          trailingIcon: _isExpanded
              ? Icons.keyboard_arrow_up
              : Icons.keyboard_arrow_down,
          size: EnableButtonSize.small,
        ),
        
        if (_isExpanded) ...[
          SizedBox(height: EnableSpacing.sm),
          Container(
            width: double.infinity,
            padding: EnableSpacing.paddingMD,
            decoration: BoxDecoration(
              color: EnableColors.surfaceVariant,
              borderRadius: EnableSizing.borderRadiusMedium,
            ),
            child: SelectableText(
              widget.errorDetails,
              style: EnableTypography.bodySmall.copyWith(
                fontFamily: 'monospace',
                color: EnableColors.textSecondary,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// SUCCESS STATE
// ═══════════════════════════════════════════════════════════════════════

/// Success State Widget
/// 
/// Shows success feedback
class EnableSuccessState extends StatelessWidget {
  final String title;
  final String? message;
  final String? actionLabel;
  final VoidCallback? onAction;

  const EnableSuccessState({
    super.key,
    required this.title,
    this.message,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: EnableSpacing.paddingXL,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Success Icon
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: EnableColors.success.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle_outline,
                size: 40,
                color: EnableColors.success,
              ),
            ),
            
            SizedBox(height: EnableSpacing.lg),
            
            // Title
            Text(
              title,
              style: EnableTypography.h3,
              textAlign: TextAlign.center,
            ),
            
            // Message
            if (message != null) ...[
              SizedBox(height: EnableSpacing.sm),
              Text(
                message!,
                style: EnableTypography.bodyMedium.copyWith(
                  color: EnableColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            
            // Action button
            if (actionLabel != null && onAction != null) ...[
              SizedBox(height: EnableSpacing.lg),
              EnableButton.primary(
                label: actionLabel!,
                onPressed: onAction,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

