import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Apispath {
  static final String BASE_URL = dotenv.env['BASE_URL']!;
}
