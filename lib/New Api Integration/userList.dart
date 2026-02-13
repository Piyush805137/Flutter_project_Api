//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../Previous Api Integration/Full Advance Apk Folder/Api Integration/api_service.dart';
//
//
// class UserListScreen extends StatefulWidget {
//   const UserListScreen({Key? key}) : super(key: key);
//
//   @override
//   _UserListScreenState createState() => _UserListScreenState();
// }
//
// class _UserListScreenState extends State<UserListScreen> {
//   List<dynamic> users = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchUsers();
//   }
//
//   Future<void> fetchUsers() async {
//     var response = await ApiService.getUser();
//     if (response != null && response['data'] != null) {
//       setState(() {
//         users = response['data'];
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return users.isEmpty
//         ? const Center(child: CircularProgressIndicator())
//         : ListView.builder(
//       itemCount: users.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           leading: CircleAvatar(
//             backgroundImage: NetworkImage(users[index]['avatar']),
//           ),
//           title: Text(users[index]['email']),
//           subtitle: Text("${users[index]['first_name']} ${users[index]['last_name']}"),
//         );
//       },
//     );
//   }
// }
