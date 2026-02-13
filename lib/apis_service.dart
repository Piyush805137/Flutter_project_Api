import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiServicesIntegration {
  final String baseUrl = "http://103.211.202.245/examwarriorsapi/api";

  // Login API Call
  Future<String?> logins(String email, String password) async {
    final String url = "$baseUrl/Auth/LoginAuthenticate?loginID=$email&password=$password";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String token = data['token'];  // API से जो token return हो रहा है, उसे लीजिए

      // Token को SharedPreferences में Save करें
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);

      return token;
    } else {
      return null;
    }
  }

  // Fetch Programs API Call
  Future<List<dynamic>?> fetchPrograms() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');

    if (token == null) return null;

    final String url = "$baseUrl/Login/GetProg";
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}
