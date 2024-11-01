import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:samsat_gpt/core.dart';

Future initialize() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    var path = await getTemporaryDirectory();
    Hive.init(path.path);
  }

  if (!Hive.isAdapterRegistered(1)) {
    //0
    // Hive.registerAdapter(LoginResultAdapter());
  }

  mainStorage = await Hive.openBox('mainStorage');

  // await AppSession.load();
  // await UserDatabase.load();
  // await ReferencesDatabase.load();
}
