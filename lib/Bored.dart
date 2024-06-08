import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  Map boredMap = {};

  getAllBoredMap() async {
    try {
      var res = await http.get(Uri.parse("https://www.boredapi.com/api/activity"));
      debugPrint("https://www.boredapi.com/api/activity");
      var data = jsonDecode(res.body);
      boredMap = data;
      debugPrint("$boredMap");

      setState(() {});
    } catch (e) {
      debugPrint("Error = $e");
    }
  }

  @override
  void initState() {
    getAllBoredMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bored",
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
                        "bored",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "activity: ${boredMap["activity"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "type: ${boredMap["type"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "participants: ${boredMap["participants"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "price: ${boredMap["price"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "link: ${boredMap["link"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "key: ${boredMap["key"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "accessibility: ${boredMap["accessibility"]}",
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

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          await getAllBoredMap();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}