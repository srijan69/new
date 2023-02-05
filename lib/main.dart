import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:build_runner/build_runner.dart';
import 'package:path_provider/path_provider.dart';

import 'HomePage.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MyApp());

  var box = await Hive.openBox('name');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: HomePage(),
    );
  }
}
