import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/controller/todo_controller.dart';
import 'package:machine_test/screens/details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var todoController = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('To-Do'),
              Obx(() => ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: todoController.todo.isEmpty
                      ? 1
                      : todoController.todo.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return todoController.todo.isEmpty
                        ? const Center(
                            child: Text('No to-do items'),
                          )
                        : ListTile(
                            onTap: (() {
                              Get.to(TodoDetails(), arguments: todoController.todo[index]);
                            }),
                            title: Text(todoController.todo[index].title),
                            subtitle:
                                Text(todoController.todo[index].description),
                          );
                  }))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/add');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
