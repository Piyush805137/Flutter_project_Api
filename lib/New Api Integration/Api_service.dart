// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class ApiService {
//   static var client = http.Client();
//
//   static Future<dynamic> getUser() async {
//     Map<String, String> requestHeaders = {
//       "Content": "application",
//       // "Content-Type": "application/json",
//     };
//
//     var url = Uri.https("reqres.in", "/api/users");
//     var response = await client.get(url, headers: requestHeaders);
//
//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body);
//       return data;
//     } else {
//       return null;
//     }
//   }
// }
