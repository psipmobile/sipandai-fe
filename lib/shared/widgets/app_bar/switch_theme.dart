// ignore_for_file: camel_case_types
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:samsat_gpt/core.dart';

class SwitchThemeWidget extends StatefulWidget {
  final GlobalKey<SliderDrawerState> sliderDrawerKey;

  const SwitchThemeWidget({
    super.key,
    required this.sliderDrawerKey,
  });

  @override
  State<SwitchThemeWidget> createState() => _SwitchThemeWidgetState();
}

class _SwitchThemeWidgetState extends State<SwitchThemeWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<bool>.dual(
      current: context.read<ThemeBloc>().state.themeMode == ThemeMode.light,
      first: true,
      second: false,
      height: 40,
      style: ToggleStyle(
        borderColor: isDarkMode(context) ? mediumEmphasis : blueGray50,
        indicatorColor: green700,
      ),
      styleBuilder: (value) => ToggleStyle(
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      borderWidth: 1,
      onChanged: (b) async {
        if (context.read<ThemeBloc>().state.isDrawerExpanded) {
          widget.sliderDrawerKey.currentState?.closeSlider();
          context.read<ThemeBloc>().add(SwitchDrawerEvent());
        }
        context.read<ThemeBloc>().add(ToggleThemeEvent());
      },
      spacing: 0,
      iconBuilder: (value) => value
          ? SvgPicture.asset(
              "assets/icons/toogle/sun.svg",
              colorFilter: colorFilterWhite,
            )
          : SvgPicture.asset(
              "assets/icons/toogle/moon.svg",
              colorFilter: colorFilterWhite,
            ),
      textBuilder: (value) => value
          ? Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/icons/toogle/moon.svg",
                  colorFilter: colorFilterBlueGray100,
                ),
              ),
            )
          : Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/icons/toogle/sun.svg",
                  colorFilter: colorFilterBlueGray100,
                ),
              ),
            ),
    );
  }
}
