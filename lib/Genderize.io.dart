import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  Map genderMap = {};

  getGenderizeMap() async {
    try {
      var res = await http.get(Uri.parse("https://api.genderize.io?name=luc"));
      debugPrint("https://api.genderize.io?name=luc");
      var data = jsonDecode(res.body);
      genderMap = data;
      debugPrint("$genderMap");

      setState(() {});
    } catch (e) {
      debugPrint("Error = $e");
    }
  }

  @override
  void initState() {
    getGenderizeMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Genderize",
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
                color: Colors.deepOrangeAccent,
                border: Border.all(width: 1, color: Colors.black),
              ),

              child: Column(
                children: [
                  Column(
                    children: [
                      const Text(
                        "Genderize.io",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "count: ${genderMap["count"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "name: ${genderMap["name"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "gender: ${genderMap["gender"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "probability: ${genderMap["probability"]}",
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