import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/theme/theme_cubit.dart';

/// [ChangeThemeSegmentedButton] is the Widget responsible for the change between the themes.
/// It's a customization of the [SegmentedButton] Widget.
///
class ChangeThemeSegmentedButton extends StatelessWidget {
  const ChangeThemeSegmentedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // This variable takes the theme from the system.
    final Brightness systemTheme = MediaQuery.platformBrightnessOf(context);

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        final ThemeMode currentThemeMode = themeState.themeMode;

        return SegmentedButton<ThemeMode>(
          segments: [
            _buildThemeSegment(
              themeMode: ThemeMode.system,
              label: 'System',
              icon: Icons.devices,
              color: systemTheme == Brightness.light
                  ? Colors.orange
                  : Colors.blueGrey,
              currentThemeMode: currentThemeMode,
            ),
            _buildThemeSegment(
              themeMode: ThemeMode.light,
              label: 'Light',
              icon: Icons.light_mode,
              color: Colors.orange,
              currentThemeMode: currentThemeMode,
            ),
            _buildThemeSegment(
              themeMode: ThemeMode.dark,
              label: 'Dark',
              icon: Icons.dark_mode,
              color: Colors.blueGrey,
              currentThemeMode: currentThemeMode,
            ),
          ],
          selected: {currentThemeMode},
          onSelectionChanged: (onChanged) =>
              context.read<ThemeCubit>().changeTheme(onChanged.first),
        );
      },
    );
  }

  /// This method is used to build a [ButtonSegment], without this it's super long.
  ///
  /// The props are:
  /// - [themeMode], used for the 'value' of [ButtonSegment].
  /// - [label], used by the [Text] Widget inside the lable from [ButtonSegment].
  /// - [icon], the [IconData] for the icon.
  /// - [color], used by label and icon for it's color.
  /// - [currentThemeMode], used to set the boolean variable [isSelected].
  ///
  /// [isSelected] is an equality between [currentThemeMode] and [themeMode], it's used to display the icon when the button is selected.
  ///
  ButtonSegment<ThemeMode> _buildThemeSegment({
    required ThemeMode themeMode,
    required String label,
    required IconData icon,
    required Color color,
    required ThemeMode currentThemeMode,
  }) {
    final bool isSelected = currentThemeMode == themeMode;

    return ButtonSegment(
      value: themeMode,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSelected)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(icon, color: color),
            ),
          Text(label, style: TextStyle(color: color)),
        ],
      ),
      icon: isSelected ? null : Icon(icon, color: color),
    );
  }
}
