import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMovieDnKey =
      dotenv.env['THE_MOVIEDB_KEY'] ?? 'NO hay un api key';
}
