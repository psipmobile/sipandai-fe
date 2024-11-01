import 'package:flutter/services.dart';
import 'package:samsat_gpt/core.dart';

Future<Uint8List> getImageFromAsset(String iconPath) async {
  return await readFileBytes(iconPath);
}
