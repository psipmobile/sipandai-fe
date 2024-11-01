import 'package:flutter/material.dart';
import 'package:samsat_gpt/core.dart';

void handleDioException(DioException e, BuildContext context) {
  if (e.error.toString().contains("Connection failed")) {
    showInfoDialog("Tidak dapat terhubung ke server");
  } else {
    showInfoDialog(e.toString());
  }
}
