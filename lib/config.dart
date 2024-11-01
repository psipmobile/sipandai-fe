import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String domain = dotenv.env["domain"] ?? "";
}
