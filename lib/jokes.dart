import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Jokes extends StatefulWidget {
  const Jokes({super.key});

  @override
  State<Jokes> createState() => _JokesState();
}

class _JokesState extends State<Jokes> {
  Map jokeList = {};

  getAlljokMap() async {
    try {
      var res = await http.get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));

      var data = jsonDecode(res.body);

      jokeList = data;
      debugPrint("=======> $jokeList");

      setState(() {});
    } catch (e) {
      debugPrint("Error = $e");
    }
  }

  @override
  void initState() {
    getAlljokMap();
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
                  const Text(
                    "IPify",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${jokeList["type"]}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${jokeList["setup"]}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${jokeList["punchline"]}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${jokeList["id"]}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),

                ],
              ),
            ),
          ),
          const SizedBox(height: 50,),

          GestureDetector(
            onTap: () {
              getAlljokMap();
              setState(() {

              });
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                  border: Border.all(color: Colors.black,width: 2)
              ),
              child: const Icon(Icons.add),
            ),
          ),



        ],
      ),
    );
  }
}