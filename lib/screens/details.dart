// ignore_for_file: unnecessary_const

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/controller/todo_controller.dart';

class TodoDetails extends StatelessWidget {
  const TodoDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arg = Get.arguments['todo'];
    var index = Get.arguments['index'];
    var todo = Get.find<TodoController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              todo.todo.remove(arg);

              Get.back();
              Get.snackbar('Deleted', 'Item Deleted');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: Get.height * 0.3,
              width: Get.width,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(5))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        const Text(
                          'Title: ',
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(arg.title.toString(),
                            style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        const Text(
                          'Description : ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(arg.description.toString(),
                            style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        const Text(
                          'Status : ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                            arg.completed == false
                                ? 'Not Completed'
                                : 'Completed',
                            style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        const Text(
                          'Duration : ',
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(arg.duration.toString(),
                            style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          TweenAnimationBuilder<Duration>(
              duration: arg.duration,
              tween: Tween(begin: arg.duration, end: Duration.zero),
              onEnd: () {},
              builder: (BuildContext context, Duration value, Widget? child) {
                final minutes = value.inMinutes;
                final seconds = value.inSeconds % 60;
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text('$minutes:$seconds',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30)));
              }),
          InkWell(
            onTap: (() {
              todo.todo[index].completed = !todo.todo[index].completed;
              //Get.back();
              Get.snackbar('Updated', 'Status Updated');
            }),
            child: Container(
              height: 30,
              width: Get.width * 0.7,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.grey),
              child: const Text(
                'Mark Completed',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
