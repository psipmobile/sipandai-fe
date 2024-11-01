// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:samsat_gpt/core.dart';
import 'package:samsat_gpt/shared/theme/theme_bloc.dart';

class SwitchDrawerWidget extends StatefulWidget {
  final GlobalKey<SliderDrawerState> sliderDrawerKey;

  const SwitchDrawerWidget({
    super.key,
    required this.sliderDrawerKey,
  });

  @override
  State<SwitchDrawerWidget> createState() => _SwitchDrawerWidgetState();
}

class _SwitchDrawerWidgetState extends State<SwitchDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.read<ThemeBloc>().state.isDrawerExpanded) {
        widget.sliderDrawerKey.currentState?.openSlider();
      }
    });

    return IconButton(
      icon: SvgPicture.asset(
        "icons/misc/dock_to_right.svg",
        colorFilter: customColorFilter(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      onPressed: () {
        widget.sliderDrawerKey.currentState?.toggle();
        context.read<ThemeBloc>().add(SwitchDrawerEvent());
      },
    );
  }
}
