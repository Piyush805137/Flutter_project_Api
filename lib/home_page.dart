import 'package:flutter/material.dart';

import 'Previous Api Integration/Full Advance Apk Folder/Api Integration/api_service.dart';
import 'apis_service.dart'; // सही Path दें

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiServicesIntegration apiService = ApiServicesIntegration();
  List<dynamic>? programs;

  @override
  void initState() {
    super.initState();
    loadPrograms();
  }

  void loadPrograms() async {
    List<dynamic>? data = await apiService.fetchPrograms();
    setState(() {
      programs = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Programs")),
      body: programs == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: programs!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(programs![index]['name'] ?? 'No Name'),
            subtitle: Text(programs![index]['description'] ?? 'No Description'),
          );
        },
      ),
    );
  }
}
