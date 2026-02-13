import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl = "https://api.quotable.io/random";

  Future<String> fetchQuote() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data["content"];
      } else {
        return "Failed to fetch quote!";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}
