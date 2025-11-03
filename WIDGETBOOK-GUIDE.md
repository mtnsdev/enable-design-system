# Widgetbook Guide - Design System Storybook

## What is Widgetbook?

**Widgetbook** is the Flutter equivalent of Storybook for React/Vue/Angular. It provides an interactive UI component catalog where you can:

- 📚 Browse all design system components
- 🎨 View design tokens (colors, typography, spacing)
- 🎛️ Adjust component properties in real-time with "knobs"
- 📱 Test components in different states
- 🌐 Share the catalog with designers and stakeholders
- 🔍 Search and navigate components easily

---

## Quick Start

### Option 1: Use the Run Script (Easiest)

**Windows:**
```bash
.\run-widgetbook.bat
```

**PowerShell/Mac/Linux:**
```bash
./run-widgetbook.ps1
```

This will:
1. Install dependencies
2. Generate the Widgetbook catalog
3. Launch in your browser at `http://localhost:8080`

### Option 2: Manual Setup

```bash
# 1. Install dependencies
flutter pub get

# 2. Generate Widgetbook catalog
dart run build_runner build --delete-conflicting-outputs

# 3. Run in browser
flutter run -d chrome -t widgetbook/main.dart --web-port=8080
```

---

## What's Included

### 🎨 Design Tokens

**Colors:**
- View all color palettes
- See hex codes
- Understand color usage

**Typography:**
- All text styles (H1-H6, Body, Labels)
- Font sizes and weights
- Usage examples

**Spacing:**
- Spacing scale (XXS to XXL)
- Visual size representations
- 8px grid system

### 🧩 Components

**EnableButton:**
- Primary, Secondary, Tertiary variants
- All states (enabled, disabled, loading)
- Interactive knobs to change labels and states

**EnableCard:**
- Basic and clickable variants
- Hover effects
- Background color options

**EnableAppBar:**
- With and without search
- Customizable titles
- Action buttons

**EnableStates:**
- Loading states
- Error states
- Empty states (no data, no results)
- Customizable messages

---

## Using Widgetbook

### Navigation

The left sidebar shows all component categories:
- **Design Tokens** - Colors, Typography, Spacing
- **Components** - All UI components

Click on any component to see it rendered.

### Knobs (Interactive Controls)

Each component has interactive "knobs" on the right panel:
- **String knobs** - Change text/labels
- **Boolean knobs** - Toggle states (enabled/disabled, show/hide)
- **Selection knobs** - Choose between options

Example:
```
Label: [Primary Button    ]  ← Change the button text
Enabled: [✓]                ← Toggle enabled/disabled
Loading: [ ]                ← Toggle loading state
```

### Viewing Multiple States

Some components (like buttons) have an "All States" view that shows:
- All variants side-by-side
- Different states (enabled, disabled, loading)
- Size variations

---

## For Developers

### Adding New Components

To add a new component to Widgetbook:

1. **Create a Use Case** in `widgetbook/main.dart`:

```dart
@widgetbook.UseCase(
  name: 'My Component',
  type: MyComponent,
)
Widget buildMyComponent(BuildContext context) {
  return Center(
    child: MyComponent(
      title: context.knobs.string(label: 'Title', initialValue: 'Hello'),
      enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
    ),
  );
}
```

2. **Regenerate the catalog:**
```bash
dart run build_runner build --delete-conflicting-outputs
```

3. **Restart Widgetbook:**
```bash
flutter run -d chrome -t widgetbook/main.dart
```

### Available Knobs

- `context.knobs.string()` - Text input
- `context.knobs.boolean()` - Checkbox toggle
- `context.knobs.list()` - Dropdown selection
- `context.knobs.number()` - Number input
- `context.knobs.slider()` - Slider control

---

## For Designers

### Reviewing Components

1. Run Widgetbook (ask a developer or use `.\run-widgetbook.bat`)
2. Open browser at `http://localhost:8080`
3. Navigate through components in the left sidebar
4. Use knobs to test different states
5. Take screenshots for design documentation

### Design Tokens

All design tokens are visible in Widgetbook:
- **Colors** - See exact hex codes and usage
- **Typography** - View font sizes, weights, line heights
- **Spacing** - Understand the spacing system

### Sharing with Team

You can share Widgetbook:
1. Run it locally and share screenshots
2. Deploy to a staging server for team access
3. Record a demo video showing components

---

## Troubleshooting

### "No generated files found"

Run the generator first:
```bash
dart run build_runner build --delete-conflicting-outputs
```

### Port already in use

Change the port:
```bash
flutter run -d chrome -t widgetbook/main.dart --web-port=3000
```

### Component not showing

1. Check that your use case has the `@widgetbook.UseCase` annotation
2. Regenerate: `dart run build_runner build --delete-conflicting-outputs`
3. Restart Widgetbook

### Changes not reflecting

Hot reload doesn't always work with Widgetbook. Stop and restart:
```bash
# Stop with Ctrl+C
# Then run again
flutter run -d chrome -t widgetbook/main.dart
```

---

## Widgetbook vs Storybook

| Feature | Storybook (React) | Widgetbook (Flutter) |
|---------|------------------|---------------------|
| Component catalog | ✓ | ✓ |
| Interactive controls (knobs) | ✓ | ✓ |
| Multiple use cases per component | ✓ | ✓ |
| Design token visualization | ✓ | ✓ |
| Hot reload | ✓ | Limited |
| Browser-based | ✓ | ✓ |
| Code generation | - | Required |

---

## Next Steps

1. **Explore the catalog** - Click through all components
2. **Test interactions** - Use knobs to change component states
3. **Share with team** - Show designers and stakeholders
4. **Add more use cases** - Cover edge cases and variations
5. **Document patterns** - Use Widgetbook to establish design patterns

---

## Resources

- [Widgetbook Documentation](https://docs.widgetbook.io/)
- [Widgetbook GitHub](https://github.com/widgetbook/widgetbook)
- [Enable Design System Guide](./DESIGN-SYSTEM-GUIDE.md)

---

**Happy exploring! 🎨**

