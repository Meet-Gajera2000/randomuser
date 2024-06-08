import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IPify extends StatefulWidget {
  const IPify({super.key});

  @override
  State<IPify> createState() => _IPifyState();
}

class _IPifyState extends State<IPify> {
  Map ipifyMap = {};

  getAllIPifyMap() async {
    try {
      var res = await http.get(Uri.parse("https://api.ipify.org?format=json"));

      debugPrint("https://api.ipify.org?format=json");

      var data = jsonDecode(res.body);

      ipifyMap = data;
      debugPrint("$ipifyMap");

      setState(() {});
    } catch (e) {
      debugPrint("Error = $e");
    }
  }

  @override
  void initState() {
    getAllIPifyMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "IPify",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.orange,
                border: Border.all(width: 2, color: Colors.black),
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      const Text(
                        "IPify",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${ipifyMap["ip"]}",
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