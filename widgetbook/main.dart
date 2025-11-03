import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:enable_design_system/enable_design_system.dart';

// Import the generated file
import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      appBuilder: (context, child) => MaterialApp(
        theme: EnableTheme.theme,
        home: child,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// ==========================================
// DESIGN TOKENS STORIES
// ==========================================

@widgetbook.UseCase(
  name: 'Color Palette',
  type: ColorTokens,
)
Widget buildColorPalette(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Primary Colors', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _ColorSwatch('Background', EnableColors.background),
            _ColorSwatch('Surface', EnableColors.surface),
            _ColorSwatch('Surface Variant', EnableColors.surfaceVariant),
            _ColorSwatch('Accent Primary', EnableColors.accentPrimary),
            _ColorSwatch('Accent Secondary', EnableColors.accentSecondary),
          ],
        ),
        const SizedBox(height: 32),
        const Text('Text Colors', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _ColorSwatch('Text Primary', EnableColors.textPrimary),
            _ColorSwatch('Text Secondary', EnableColors.textSecondary),
            _ColorSwatch('Text Tertiary', EnableColors.textTertiary),
          ],
        ),
        const SizedBox(height: 32),
        const Text('State Colors', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _ColorSwatch('Success', EnableColors.success),
            _ColorSwatch('Error', EnableColors.error),
          ],
        ),
      ],
    ),
  );
}

class _ColorSwatch extends StatelessWidget {
  final String name;
  final Color color;

  const _ColorSwatch(this.name, this.color);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 140,
            height: 80,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white24),
            ),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontSize: 12)),
          Text(
            '#${color.value.toRadixString(16).substring(2).toUpperCase()}',
            style: const TextStyle(fontSize: 10, color: Colors.white60),
          ),
        ],
      ),
    );
  }
}

class ColorTokens extends StatelessWidget {
  const ColorTokens({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox();
}

@widgetbook.UseCase(
  name: 'Typography Scale',
  type: TypographyTokens,
)
Widget buildTypography(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Typography System', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        const SizedBox(height: 32),
        
        _TypoExample('H1 - Large Headings', EnableTypography.h1),
        _TypoExample('H2 - Section Headings', EnableTypography.h2),
        _TypoExample('H3 - Subsection Headings', EnableTypography.h3),
        _TypoExample('H4 - Card Titles', EnableTypography.h4),
        _TypoExample('H5 - Small Headings', EnableTypography.h5),
        _TypoExample('H6 - Smallest Headings', EnableTypography.h6),
        const SizedBox(height: 24),
        _TypoExample('Body Large - Main Content', EnableTypography.bodyLarge),
        _TypoExample('Body Medium - Standard Text', EnableTypography.bodyMedium),
        _TypoExample('Body Small - Fine Print', EnableTypography.bodySmall),
        const SizedBox(height: 24),
        _TypoExample('Label Large - Buttons & Labels', EnableTypography.labelLarge),
        _TypoExample('Label Medium - Form Labels', EnableTypography.labelMedium),
        _TypoExample('Label Small - Helper Text', EnableTypography.labelSmall),
      ],
    ),
  );
}

class _TypoExample extends StatelessWidget {
  final String label;
  final TextStyle style;

  const _TypoExample(this.label, this.style);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 10, color: Colors.white60)),
          const SizedBox(height: 4),
          Text('The quick brown fox jumps over the lazy dog', style: style),
        ],
      ),
    );
  }
}

class TypographyTokens extends StatelessWidget {
  const TypographyTokens({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox();
}

@widgetbook.UseCase(
  name: 'Spacing Scale',
  type: SpacingTokens,
)
Widget buildSpacing(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Spacing System (8px Grid)', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 32),
        _SpacingExample('XXS', EnableSpacing.xxs),
        _SpacingExample('XS', EnableSpacing.xs),
        _SpacingExample('SM', EnableSpacing.sm),
        _SpacingExample('MD', EnableSpacing.md),
        _SpacingExample('LG', EnableSpacing.lg),
        _SpacingExample('XL', EnableSpacing.xl),
        _SpacingExample('XXL', EnableSpacing.xxl),
      ],
    ),
  );
}

class _SpacingExample extends StatelessWidget {
  final String label;
  final double size;

  const _SpacingExample(this.label, this.size);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text('$label (${size.toInt()}px)', style: const TextStyle(fontSize: 12)),
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

class SpacingTokens extends StatelessWidget {
  const SpacingTokens({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox();
}

// ==========================================
// BUTTON STORIES
// ==========================================

@widgetbook.UseCase(
  name: 'Primary Button',
  type: EnableButton,
)
Widget buildPrimaryButton(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EnableButton.primary(
          label: context.knobs.string(label: 'Label', initialValue: 'Primary Button'),
          onPressed: context.knobs.boolean(label: 'Enabled', initialValue: true) ? () {} : null,
          isLoading: context.knobs.boolean(label: 'Loading', initialValue: false),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Secondary Button',
  type: EnableButton,
)
Widget buildSecondaryButton(BuildContext context) {
  return Center(
    child: EnableButton.secondary(
      label: context.knobs.string(label: 'Label', initialValue: 'Secondary Button'),
      onPressed: context.knobs.boolean(label: 'Enabled', initialValue: true) ? () {} : null,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Tertiary Button',
  type: EnableButton,
)
Widget buildTertiaryButton(BuildContext context) {
  return Center(
    child: EnableButton.tertiary(
      label: context.knobs.string(label: 'Label', initialValue: 'Tertiary Button'),
      onPressed: context.knobs.boolean(label: 'Enabled', initialValue: true) ? () {} : null,
    ),
  );
}

@widgetbook.UseCase(
  name: 'All Button States',
  type: EnableButton,
)
Widget buildAllButtonStates(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Primary Buttons', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              EnableButton.primary(label: 'Enabled', onPressed: () {}),
              EnableButton.primary(label: 'Disabled', onPressed: null),
              EnableButton.primary(label: 'Loading', onPressed: null, isLoading: true),
            ],
          ),
          const SizedBox(height: 32),
          const Text('Secondary Buttons', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              EnableButton.secondary(label: 'Enabled', onPressed: () {}),
              EnableButton.secondary(label: 'Disabled', onPressed: null),
            ],
          ),
          const SizedBox(height: 32),
          const Text('Tertiary Buttons', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              EnableButton.tertiary(label: 'Enabled', onPressed: () {}),
              EnableButton.tertiary(label: 'Disabled', onPressed: null),
            ],
          ),
        ],
      ),
    ),
  );
}

// ==========================================
// CARD STORIES
// ==========================================

@widgetbook.UseCase(
  name: 'Basic Card',
  type: EnableCard,
)
Widget buildBasicCard(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 300,
      child: EnableCard(
        backgroundColor: EnableColors.surface,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Card Title', style: EnableTypography.h4),
              const SizedBox(height: 8),
              Text('This is a basic card with some content inside.', style: EnableTypography.bodyMedium),
            ],
          ),
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Clickable Card',
  type: EnableCard,
)
Widget buildClickableCard(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 300,
      child: EnableCard.clickable(
        onTap: () {},
        backgroundColor: EnableColors.surface,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Clickable Card', style: EnableTypography.h4),
              const SizedBox(height: 8),
              Text('Hover over me to see the effect!', style: EnableTypography.bodyMedium),
            ],
          ),
        ),
      ),
    ),
  );
}

// ==========================================
// APP BAR STORIES
// ==========================================

@widgetbook.UseCase(
  name: 'App Bar with Search',
  type: EnableAppBar,
)
Widget buildAppBarWithSearch(BuildContext context) {
  return Scaffold(
    appBar: EnableAppBar(
      title: context.knobs.string(label: 'Title', initialValue: 'Products'),
      showSearch: context.knobs.boolean(label: 'Show Search', initialValue: true),
      searchController: TextEditingController(),
      onSearchChanged: (query) {},
      actions: const [],
    ),
    body: const Center(
      child: Text('App Bar with search functionality'),
    ),
  );
}

@widgetbook.UseCase(
  name: 'App Bar without Search',
  type: EnableAppBar,
)
Widget buildAppBarBasic(BuildContext context) {
  return Scaffold(
    appBar: EnableAppBar(
      title: context.knobs.string(label: 'Title', initialValue: 'Screen Title'),
      showSearch: false,
      actions: const [],
    ),
    body: const Center(
      child: Text('Basic app bar without search'),
    ),
  );
}

// ==========================================
// STATE WIDGETS STORIES
// ==========================================

@widgetbook.UseCase(
  name: 'Loading State',
  type: EnableLoadingState,
)
Widget buildLoadingState(BuildContext context) {
  return EnableLoadingState(
    message: context.knobs.string(label: 'Message', initialValue: 'Loading data...'),
  );
}

@widgetbook.UseCase(
  name: 'Error State',
  type: EnableErrorState,
)
Widget buildErrorState(BuildContext context) {
  return EnableErrorState(
    title: context.knobs.string(label: 'Title', initialValue: 'Something went wrong'),
    message: context.knobs.string(label: 'Message', initialValue: 'Unable to load the requested data'),
    actionLabel: context.knobs.string(label: 'Action Label', initialValue: 'Retry'),
    onAction: () {},
  );
}

@widgetbook.UseCase(
  name: 'Empty State - No Data',
  type: EnableEmptyState,
)
Widget buildEmptyStateNoData(BuildContext context) {
  return EnableEmptyState.noData(
    dataType: context.knobs.string(label: 'Data Type', initialValue: 'products'),
    description: context.knobs.string(label: 'Description', initialValue: 'Products will appear here once added'),
  );
}

@widgetbook.UseCase(
  name: 'Empty State - No Results',
  type: EnableEmptyState,
)
Widget buildEmptyStateNoResults(BuildContext context) {
  return EnableEmptyState.noResults(
    description: context.knobs.string(label: 'Description', initialValue: 'Try different keywords or filters'),
    actionLabel: context.knobs.string(label: 'Action Label', initialValue: 'Clear Filters'),
    onAction: () {},
  );
}

