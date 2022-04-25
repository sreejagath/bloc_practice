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
    Duration? duration;
    Duration? remaining;
    var timeUp = false;

    Duration parseDuration(String s) {
      int hours = 0;
      int minutes = 0;
      int micros;
      List<String> parts = s.split(':');
      if (parts.length > 2) {
        hours = int.parse(parts[parts.length - 3]);
      }
      if (parts.length > 1) {
        minutes = int.parse(parts[parts.length - 2]);
      }
      micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
      duration = Duration(
        hours: hours,
        minutes: minutes,
      );
      return Duration(hours: hours, minutes: minutes);
    }

    parseDuration(arg['duration']);
    var _lastConso = DateTime.parse(arg['createdAt']).add(duration!);
    var diff = DateTime.now().difference(_lastConso);
    // if(_lastConso )
    var now = DateTime.now();
    if (_lastConso.compareTo(now) > 0) {
      timeUp = true;
      remaining = _lastConso.difference(now);
      duration = _lastConso.difference(now);
      print('Compare to now ${_lastConso.compareTo(now)}');
    } else {
      timeUp = false;
      // remaining = _lastConso.difference(now);
      // duration = _lastConso.difference(now);
    }
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
                        Text(arg['title'].toString(),
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
                        Text(arg['description'].toString(),
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
                            arg['completed'] == false
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
                        Text(arg['duration'].toString(),
                            style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          timeUp
              ? TweenAnimationBuilder<Duration>(
                  duration: duration!,
                  tween: Tween(begin: duration, end: Duration.zero),
                  onEnd: () {},
                  builder:
                      (BuildContext context, Duration value, Widget? child) {
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
                  })
              : const Text('Time Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30)),
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
