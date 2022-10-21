import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Apispath {
  static final String URL = dotenv.env['URL']!;
}
