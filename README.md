# Enable Design System

A comprehensive design system for the Enable platform providing standardized components, design tokens, and consistent UI/UX across all applications.

[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/mtnsdev/enable-design-system)
[![Flutter](https://img.shields.io/badge/flutter-3.10%2B-blue.svg)](https://flutter.dev/)

---

## 📦 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  enable_design_system:
    git:
      url: https://github.com/mtnsdev/enable-design-system.git
      ref: main
```

Then run:

```bash
flutter pub get
```

---

## 🚀 Quick Start

Import the package:

```dart
import 'package:enable_design_system/enable_design_system.dart';
```

Apply the theme to your app:

```dart
MaterialApp(
  theme: EnableTheme.theme,
  home: YourHomePage(),
);
```

Use components:

```dart
// App Bar with search
EnableAppBar(
  title: 'Products',
  showSearch: true,
  searchController: _searchController,
  onSearchChanged: (query) => print(query),
)

// Clickable card
EnableCard.clickable(
  onTap: () => print('Card tapped'),
  backgroundColor: EnableColors.background,
  child: Text('Card content'),
)

// Primary button
EnableButton.primary(
  label: 'Save',
  onPressed: () => print('Saved'),
)

// Loading state
EnableLoadingState(message: 'Loading data...')
```

---

## 🎨 Design Tokens

### Colors

```dart
EnableColors.background      // #121212 - Dark background
EnableColors.surface         // #1E1E1E - Card/surface background
EnableColors.surfaceVariant  // #2A2A2A - Elevated surfaces
EnableColors.textPrimary     // #FFFFFF - Primary text
EnableColors.textSecondary   // #B0B0B0 - Secondary text
EnableColors.textTertiary    // #808080 - Tertiary text
EnableColors.accentPrimary   // #8B7355 - Brand accent
EnableColors.accentSecondary // #6B5B45 - Secondary accent
EnableColors.error           // #CF6679 - Error states
EnableColors.success         // #4CAF50 - Success states
```

### Typography

```dart
// Headings
EnableTypography.h1  // 32px, semiBold
EnableTypography.h2  // 28px, semiBold
EnableTypography.h3  // 24px, semiBold
EnableTypography.h4  // 20px, semiBold
EnableTypography.h5  // 18px, medium
EnableTypography.h6  // 16px, medium

// Body text
EnableTypography.bodyLarge   // 16px, light (w300)
EnableTypography.bodyMedium  // 14px, light (w300)
EnableTypography.bodySmall   // 12px, light (w300)

// Labels
EnableTypography.labelLarge  // 16px, regular (w400)
EnableTypography.labelMedium // 14px, regular (w400)
EnableTypography.labelSmall  // 12px, regular (w400)
```

### Spacing

```dart
EnableSpacing.xxs  // 4px  - Tiny gaps
EnableSpacing.xs   // 8px  - Small gaps
EnableSpacing.sm   // 12px - Card padding
EnableSpacing.md   // 16px - Standard spacing
EnableSpacing.lg   // 24px - Large spacing
EnableSpacing.xl   // 32px - Section spacing
EnableSpacing.xxl  // 48px - Page margins
```

### Sizing

```dart
// Component sizes
EnableSizing.buttonHeight  // 48px
EnableSizing.inputHeight   // 48px
EnableSizing.cardRadius    // 8px
EnableSizing.borderRadius  // 8px

// Icon sizes
EnableSizing.iconXs   // 16px
EnableSizing.iconSm   // 20px
EnableSizing.iconMd   // 24px
EnableSizing.iconLg   // 32px
EnableSizing.iconXl   // 48px
```

---

## 🧩 Components

### EnableAppBar

Standardized app bar with optional search functionality.

```dart
EnableAppBar(
  title: 'My Screen',
  showSearch: true,
  searchController: _controller,
  searchHint: 'Search...',
  onSearchChanged: (query) {},
  actions: [
    AppBarAction(
      icon: Icons.filter_list,
      onTap: () {},
      tooltip: 'Filter',
    ),
  ],
)
```

### EnableCard

Card component with hover states.

```dart
// Clickable card
EnableCard.clickable(
  onTap: () {},
  backgroundColor: EnableColors.background,
  child: Padding(
    padding: EdgeInsets.all(EnableSpacing.md),
    child: Text('Card content'),
  ),
)

// Static card
EnableCard(
  backgroundColor: EnableColors.surface,
  child: YourContent(),
)
```

### EnableButton

Three button variants: Primary, Secondary, Tertiary.

```dart
// Primary button (filled)
EnableButton.primary(
  label: 'Save',
  onPressed: () {},
  isLoading: false,
)

// Secondary button (outlined)
EnableButton.secondary(
  label: 'Cancel',
  onPressed: () {},
)

// Tertiary button (text only)
EnableButton.tertiary(
  label: 'Skip',
  onPressed: () {},
)
```

### EnableStates

Loading, error, and empty state widgets.

```dart
// Loading state
EnableLoadingState(
  message: 'Loading data...',
)

// Error state
EnableErrorState(
  title: 'Failed to load',
  message: error.toString(),
  actionLabel: 'Retry',
  onAction: () {},
)

// Empty state - No data
EnableEmptyState.noData(
  dataType: 'products',
  description: 'Products will appear here',
)

// Empty state - No results
EnableEmptyState.noResults(
  description: 'Try different keywords',
  actionLabel: 'Clear filters',
  onAction: () {},
)
```

---

## 🎯 Usage Examples

### Complete Screen Example

```dart
import 'package:flutter/material.dart';
import 'package:enable_design_system/enable_design_system.dart';

class ProductsScreen extends StatefulWidget {
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final _searchController = TextEditingController();
  bool _isLoading = true;
  List<Product> _products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EnableAppBar(
        title: 'Products',
        showSearch: true,
        searchController: _searchController,
        onSearchChanged: _handleSearch,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const EnableLoadingState(message: 'Loading products...');
    }

    if (_products.isEmpty) {
      return const EnableEmptyState.noData(
        dataType: 'products',
        description: 'Products will appear here once added',
      );
    }

    return GridView.builder(
      padding: EdgeInsets.all(EnableSpacing.lg),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: EnableSpacing.lg,
        crossAxisSpacing: EnableSpacing.lg,
      ),
      itemCount: _products.length,
      itemBuilder: (context, index) => _buildProductCard(_products[index]),
    );
  }

  Widget _buildProductCard(Product product) {
    return EnableCard.clickable(
      onTap: () => _showProductDetails(product),
      backgroundColor: EnableColors.background,
      child: Padding(
        padding: EdgeInsets.all(EnableSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.name, style: EnableTypography.h4),
            SizedBox(height: EnableSpacing.xs),
            Text(product.category, style: EnableTypography.bodySmall),
          ],
        ),
      ),
    );
  }
}
```

---

## 📚 Documentation

For detailed documentation, see:

- [Design System Guide](./DESIGN-SYSTEM-GUIDE.md) - Complete usage guide
- [Component API Reference](./API.md) - Detailed component documentation
- [Migration Guide](./MIGRATION.md) - How to migrate existing apps

---

## 🎨 Design System Showcase

To see all components in action, check out the example app:

```bash
cd example
flutter run
```

---

## 🤝 Contributing

Contributions are welcome! Please read our [Contributing Guide](./CONTRIBUTING.md) before submitting PRs.

### Development Setup

1. Clone the repository
2. Run `flutter pub get`
3. Make your changes
4. Run tests: `flutter test`
5. Submit a PR

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

---

## 🔗 Links

- **Repository:** https://github.com/mtnsdev/enable-design-system
- **Issues:** https://github.com/mtnsdev/enable-design-system/issues
- **Main App:** https://github.com/mtnsdev/enable-web

---

## 📝 Changelog

See [CHANGELOG.md](./CHANGELOG.md) for version history and updates.

---

**Built with ❤️ for the Enable platform**

