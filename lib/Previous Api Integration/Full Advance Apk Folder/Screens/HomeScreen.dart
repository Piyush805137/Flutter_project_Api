import 'package:flutter/material.dart';

import '../Api Integration/api_service.dart';
import '../SQLite for Task Management/db_service.dart';
import '../SQLite for Task Management/task_model.dart';


class HomeScreen extends StatelessWidget {
  final ApiService apiService = ApiService();
  final DBService dbService = DBService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task Manager")),
      body: FutureBuilder(
        future: dbService.getTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            List<Task> tasks = snapshot.data as List<Task>;
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index].title),
                  subtitle: Text(tasks[index].description),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      await dbService.deleteTask(tasks[index].id!);
                      (context as Element).reassemble();
                    },
                  ),
                );
              },
            );
          }
          return const Center(child: Text("No tasks yet!"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String quote = await apiService.fetchQuote();
          await dbService.insertTask(Task(title: "New Task", description: quote));
          (context as Element).reassemble();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
