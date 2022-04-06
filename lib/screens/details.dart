// ignore_for_file: unnecessary_const

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoDetails extends StatelessWidget {
  const TodoDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arg = Get.arguments;
    print(arg);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
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
                        Text(
                          'Title: ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(arg.title.toString(),
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text(
                          'Description : ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(arg.description.toString(),
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text(
                          'Status : ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                            arg.completed == false
                                ? 'Not Completed'
                                : 'Completed',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text(
                          'Duration : ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(arg.duration.toString(),
                            style: TextStyle(color: Colors.white)),
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
              onEnd: () {
                print('Timer ended');
              },
              builder: (BuildContext context, Duration value, Widget? child) {
                final minutes = value.inMinutes;
                final seconds = value.inSeconds % 60;
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text('$minutes:$seconds',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30)));
              }),
        ],
      ),
    );
  }
}
