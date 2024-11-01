import 'package:samsat_gpt/core.dart';

import 'package:flutter/material.dart';

Future showDialogBase({
  required Widget content,
  double? maxWidth,
  bool? barrierDismissible,
}) async {
  await showDialog<void>(
    context: globalContext,
    barrierDismissible: barrierDismissible ?? false,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        content: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: maxWidth ?? 450,
          ),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: content,
          ),
        ),
      );
    },
  );
}
