import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:machine_test/screens/add.dart';
import 'package:machine_test/screens/details.dart';
import 'package:machine_test/screens/home.dart';

Future<void> main() async {
  runApp(const HomePage());
  await GetStorage.init();
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const MyHomePage(),
        ),
        GetPage(
          name: '/add',
          page: () => AddScreen(),
        ),
        GetPage(
          name: '/details',
          page: () => const TodoDetails(),
        ),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
    );
  }
}

