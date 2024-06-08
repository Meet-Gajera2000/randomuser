import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Io extends StatefulWidget {
  const Io({super.key});

  @override
  State<Io> createState() => _IoState();
}

class _IoState extends State<Io> {
  Map agifyMap = {};

  getAgifyMap() async {
    try {
      var res = await http.get(Uri.parse("https://api.agify.io?name=meelad"));
      debugPrint("https://api.agify.io?name=meelad");
      var data = jsonDecode(res.body);
      agifyMap = data;
      debugPrint("$agifyMap");

      setState(() {});
    } catch (e) {
      debugPrint("Error = $e");
    }
  }

  @override
  void initState() {
    getAgifyMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Agify.io",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
        ),
      ),

      body: Column(
        children: [
          Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amberAccent,
                border: Border.all(width: 1, color: Colors.black),
              ),

              child: Column(
                children: [
                  Column(
                    children: [
                      const Text(
                        "Agify.io",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "count: ${agifyMap["count"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "name: ${agifyMap["name"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "age: ${agifyMap["age"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}