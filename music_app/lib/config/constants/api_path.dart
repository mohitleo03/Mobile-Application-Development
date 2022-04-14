import 'package:flutter_dotenv/flutter_dotenv.dart';

class Apispath {
  static String BASE_URL = dotenv.env['BASE_URL']!;
}
