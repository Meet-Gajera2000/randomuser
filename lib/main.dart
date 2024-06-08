import 'package:flutter/material.dart';
import 'package:randomuser/universities.dart';
import 'Agify.io.dart';
import 'Bored.dart';
import 'animal.dart';
import 'data USA.dart';
import 'dogs.dart';
import 'Genderize.io.dart';
import 'IPify.dart';
import 'iPinfo.dart';
import 'jokes.dart';
import 'nationalize.io.dart';
import 'zippopotam.dart';
import 'coindesk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Zippopotam(),
    );
  }
}
