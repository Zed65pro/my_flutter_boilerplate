import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrls {
  static final String _baseUrl = dotenv.env['BASE_API_URL'] ?? '';
}
