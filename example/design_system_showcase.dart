import 'package:flutter/material.dart';
import 'package:enable_web/core/design_system.dart';
import 'package:enable_web/core/components/components.dart';

/// Design System Showcase
/// 
/// Visual demonstration of all design system components, colors, typography, etc.
/// Navigate to /design-system to view this page.

class DesignSystemShowcase extends StatelessWidget {
  const DesignSystemShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EnableColors.background,
      appBar: EnableAppBar(
        title: Text('Enable Design System Showcase', style: EnableTypography.h2),
        actions: [
          AppBarAction(
            icon: Icons.close,
            onTap: () => Navigator.of(context).pop(),
            tooltip: 'Close',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EnableSpacing.paddingXL,
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: EnableSizing.contentMaxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Text('🎨 Design System', style: EnableTypography.displayLarge),
                SizedBox(height: EnableSpacing.sm),
                Text(
                  'All components, colors, typography, and styles used in the Enable platform',
                  style: EnableTypography.bodyLarge,
                ),
                
                SizedBox(height: EnableSpacing.xxl),
                
                // COLORS
                _SectionTitle('Colors'),
                _ColorPalette(),
                
                SizedBox(height: EnableSpacing.xxl),
                
                // TYPOGRAPHY
                _SectionTitle('Typography'),
                _TypographyShowcase(),
                
                SizedBox(height: EnableSpacing.xxl),
                
                // BUTTONS
                _SectionTitle('Buttons'),
                _ButtonShowcase(),
                
                SizedBox(height: EnableSpacing.xxl),
                
                // CARDS
                _SectionTitle('Cards'),
                _CardShowcase(),
                
                SizedBox(height: EnableSpacing.xxl),
                
                // STATES
                _SectionTitle('States'),
                _StatesShowcase(),
                
                SizedBox(height: EnableSpacing.xxl),
                
                // SPACING
                _SectionTitle('Spacing (8px Grid)'),
                _SpacingShowcase(),
                
                SizedBox(height: EnableSpacing.huge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Section Title
class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: EnableTypography.h1),
        SizedBox(height: EnableSpacing.xs),
        Container(
          height: 2,
          width: 60,
          color: EnableColors.accentPrimary,
        ),
        SizedBox(height: EnableSpacing.lg),
      ],
    );
  }
}

// COLOR PALETTE
class _ColorPalette extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: EnableSpacing.md,
      runSpacing: EnableSpacing.md,
      children: [
        _ColorSwatch('Background', EnableColors.background),
        _ColorSwatch('Surface', EnableColors.surface),
        _ColorSwatch('Surface Variant', EnableColors.surfaceVariant),
        _ColorSwatch('Text Primary', EnableColors.textPrimary),
        _ColorSwatch('Text Secondary', EnableColors.textSecondary),
        _ColorSwatch('Text Tertiary', EnableColors.textTertiary),
        _ColorSwatch('Accent Primary', EnableColors.accentPrimary),
        _ColorSwatch('Accent Hover', EnableColors.accentHover),
        _ColorSwatch('Border', EnableColors.border),
        _ColorSwatch('Button Primary', EnableColors.buttonPrimary),
        _ColorSwatch('Success', EnableColors.success),
        _ColorSwatch('Error', EnableColors.error),
        _ColorSwatch('Warning', EnableColors.warning),
        _ColorSwatch('Info', EnableColors.info),
      ],
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  final String name;
  final Color color;

  const _ColorSwatch(this.name, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 140,
            height: 80,
            decoration: BoxDecoration(
              color: color,
              borderRadius: EnableSizing.borderRadiusMedium,
              border: Border.all(
                color: EnableColors.borderDisabled,
                width: 1,
              ),
            ),
          ),
          SizedBox(height: EnableSpacing.xs),
          Text(name, style: EnableTypography.labelSmall),
          Text(
            '#${color.value.toRadixString(16).substring(2).toUpperCase()}',
            style: EnableTypography.caption,
          ),
        ],
      ),
    );
  }
}

// TYPOGRAPHY SHOWCASE
class _TypographyShowcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TypoExample('Display Large', EnableTypography.displayLarge),
        _TypoExample('Display Medium', EnableTypography.displayMedium),
        _TypoExample('Display Small', EnableTypography.displaySmall),
        SizedBox(height: EnableSpacing.md),
        _TypoExample('Heading 1', EnableTypography.h1),
        _TypoExample('Heading 2', EnableTypography.h2),
        _TypoExample('Heading 3', EnableTypography.h3),
        _TypoExample('Heading 4', EnableTypography.h4),
        _TypoExample('Heading 5', EnableTypography.h5),
        SizedBox(height: EnableSpacing.md),
        _TypoExample('Body Large', EnableTypography.bodyLarge),
        _TypoExample('Body Medium', EnableTypography.bodyMedium),
        _TypoExample('Body Small', EnableTypography.bodySmall),
        SizedBox(height: EnableSpacing.md),
        _TypoExample('Label Large', EnableTypography.labelLarge),
        _TypoExample('Label Medium', EnableTypography.labelMedium),
        _TypoExample('Label Small', EnableTypography.labelSmall),
        _TypoExample('Caption', EnableTypography.caption),
      ],
    );
  }
}

class _TypoExample extends StatelessWidget {
  final String label;
  final TextStyle style;

  const _TypoExample(this.label, this.style);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: EnableSpacing.xs),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            child: Text(label, style: EnableTypography.labelSmall),
          ),
          Expanded(
            child: Text('The quick brown fox jumps over the lazy dog', style: style),
          ),
        ],
      ),
    );
  }
}

// BUTTON SHOWCASE
class _ButtonShowcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Primary Buttons
        Text('Primary Buttons', style: EnableTypography.h4),
        SizedBox(height: EnableSpacing.md),
        Wrap(
          spacing: EnableSpacing.md,
          runSpacing: EnableSpacing.md,
          children: [
            EnableButton.primary(
              label: 'Primary Button',
              onPressed: () {},
            ),
            EnableButton.primary(
              label: 'With Icon',
              onPressed: () {},
              leadingIcon: Icons.add,
            ),
            EnableButton.primary(
              label: 'Loading',
              onPressed: null,
              isLoading: true,
            ),
            EnableButton.primary(
              label: 'Disabled',
              onPressed: null,
            ),
          ],
        ),
        
        SizedBox(height: EnableSpacing.lg),
        
        // Secondary Buttons
        Text('Secondary Buttons', style: EnableTypography.h4),
        SizedBox(height: EnableSpacing.md),
        Wrap(
          spacing: EnableSpacing.md,
          runSpacing: EnableSpacing.md,
          children: [
            EnableButton.secondary(
              label: 'Secondary Button',
              onPressed: () {},
            ),
            EnableButton.secondary(
              label: 'With Icon',
              onPressed: () {},
              trailingIcon: Icons.arrow_forward,
            ),
            EnableButton.secondary(
              label: 'Disabled',
              onPressed: null,
            ),
          ],
        ),
        
        SizedBox(height: EnableSpacing.lg),
        
        // Tertiary Buttons
        Text('Tertiary Buttons', style: EnableTypography.h4),
        SizedBox(height: EnableSpacing.md),
        Wrap(
          spacing: EnableSpacing.md,
          runSpacing: EnableSpacing.md,
          children: [
            EnableButton.tertiary(
              label: 'Tertiary Button',
              onPressed: () {},
            ),
            EnableButton.tertiary(
              label: 'With Icon',
              onPressed: () {},
              leadingIcon: Icons.info_outline,
            ),
          ],
        ),
        
        SizedBox(height: EnableSpacing.lg),
        
        // Icon Buttons
        Text('Icon Buttons', style: EnableTypography.h4),
        SizedBox(height: EnableSpacing.md),
        Wrap(
          spacing: EnableSpacing.md,
          runSpacing: EnableSpacing.md,
          children: [
            EnableIconButton(
              icon: Icons.favorite_border,
              onPressed: () {},
              tooltip: 'Favorite',
            ),
            EnableIconButton(
              icon: Icons.bookmark,
              onPressed: () {},
              tooltip: 'Bookmark',
              isActive: true,
            ),
            EnableIconButton(
              icon: Icons.share,
              onPressed: () {},
              tooltip: 'Share',
            ),
          ],
        ),
        
        SizedBox(height: EnableSpacing.lg),
        
        // Sizes
        Text('Button Sizes', style: EnableTypography.h4),
        SizedBox(height: EnableSpacing.md),
        Wrap(
          spacing: EnableSpacing.md,
          runSpacing: EnableSpacing.md,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            EnableButton.primary(
              label: 'Small',
              onPressed: () {},
              size: EnableButtonSize.small,
            ),
            EnableButton.primary(
              label: 'Medium',
              onPressed: () {},
              size: EnableButtonSize.medium,
            ),
            EnableButton.primary(
              label: 'Large',
              onPressed: () {},
              size: EnableButtonSize.large,
            ),
          ],
        ),
      ],
    );
  }
}

// CARD SHOWCASE
class _CardShowcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Card Variants', style: EnableTypography.h4),
        SizedBox(height: EnableSpacing.md),
        
        Wrap(
          spacing: EnableSpacing.md,
          runSpacing: EnableSpacing.md,
          children: [
            // Default Card
            EnableCard(
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Default Card', style: EnableTypography.h4),
                  SizedBox(height: EnableSpacing.xs),
                  Text('With subtle border', style: EnableTypography.bodySmall),
                ],
              ),
            ),
            
            // Clickable Card
            EnableCard.clickable(
              width: 250,
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Clickable Card', style: EnableTypography.h4),
                  SizedBox(height: EnableSpacing.xs),
                  Text('Hover to see animation', style: EnableTypography.bodySmall),
                ],
              ),
            ),
            
            // Elevated Card
            EnableCard.elevated(
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Elevated Card', style: EnableTypography.h4),
                  SizedBox(height: EnableSpacing.xs),
                  Text('With shadow', style: EnableTypography.bodySmall),
                ],
              ),
            ),
          ],
        ),
        
        SizedBox(height: EnableSpacing.lg),
        
        // Product Card
        Text('Product Card', style: EnableTypography.h4),
        SizedBox(height: EnableSpacing.md),
        Container(
          width: 320,
          child: ProductCard(
            imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
            title: 'Mountain Adventure Tour',
            subtitle: 'Experience breathtaking views and thrilling activities',
            category: 'Adventure',
            onTap: () {},
            showBookmark: true,
            isBookmarked: false,
            onBookmarkTap: () {},
          ),
        ),
      ],
    );
  }
}

// STATES SHOWCASE
class _StatesShowcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Loading State
        Text('Loading State', style: EnableTypography.h4),
        SizedBox(height: EnableSpacing.md),
        Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: EnableColors.borderDisabled),
            borderRadius: EnableSizing.borderRadiusMedium,
          ),
          child: EnableLoadingState(message: 'Loading products...'),
        ),
        
        SizedBox(height: EnableSpacing.lg),
        
        // Empty State
        Text('Empty State', style: EnableTypography.h4),
        SizedBox(height: EnableSpacing.md),
        Container(
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(color: EnableColors.borderDisabled),
            borderRadius: EnableSizing.borderRadiusMedium,
          ),
          child: EnableEmptyState.noResults(
            description: 'Try adjusting your search or filters',
            actionLabel: 'Clear Filters',
            onAction: () {},
          ),
        ),
        
        SizedBox(height: EnableSpacing.lg),
        
        // Error State
        Text('Error State', style: EnableTypography.h4),
        SizedBox(height: EnableSpacing.md),
        Container(
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(color: EnableColors.borderDisabled),
            borderRadius: EnableSizing.borderRadiusMedium,
          ),
          child: EnableErrorState(
            title: 'Connection Error',
            message: 'Unable to connect to the server',
            onAction: () {},
          ),
        ),
      ],
    );
  }
}

// SPACING SHOWCASE
class _SpacingShowcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SpacingExample('XXS', EnableSpacing.xxs),
        _SpacingExample('XS', EnableSpacing.xs),
        _SpacingExample('SM', EnableSpacing.sm),
        _SpacingExample('MD', EnableSpacing.md),
        _SpacingExample('LG', EnableSpacing.lg),
        _SpacingExample('XL', EnableSpacing.xl),
        _SpacingExample('XXL', EnableSpacing.xxl),
      ],
    );
  }
}

class _SpacingExample extends StatelessWidget {
  final String label;
  final double size;

  const _SpacingExample(this.label, this.size);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: EnableSpacing.sm),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Text('$label (${size.toInt()}px)', style: EnableTypography.labelSmall),
          ),
          Container(
            width: size,
            height: 24,
            color: EnableColors.accentPrimary,
          ),
        ],
      ),
    );
  }
}

