import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LineDash extends StatelessWidget {
  Color? color;
  LineDash({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    color ??= Theme.of(context).colorScheme.onSurface;
    return Row(
      children: List.generate(
        150 ~/ 3,
        (index) => Expanded(
          child: Container(
            color: index % 2 == 0 ? Colors.transparent : color,
            height: 1,
          ),
        ),
      ),
    );
  }
}
