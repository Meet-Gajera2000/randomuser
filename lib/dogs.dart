import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Dog extends StatefulWidget {
  const Dog({super.key});

  @override
  State<Dog> createState() => _DogState();
}

class _DogState extends State<Dog> {
  Map dogMap = {};

  getAllDogsMap() async {
    try {
      var res = await http.get(Uri.parse("https://dog.ceo/api/breeds/image/random"));
      debugPrint("https://dog.ceo/api/breeds/image/random");
      var data = jsonDecode(res.body);
      dogMap = data;
      debugPrint("$dogMap");
      setState(() {});
    } catch (e) {
      debugPrint("Error = $e");
    }
  }

  @override
  void initState() {
    getAllDogsMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dogs",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange,
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: ClipRRect(borderRadius: BorderRadius.circular(10),
                    child: Image.network("${dogMap["message"]}", fit: BoxFit.cover)),
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(color: Colors.cyan, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.white30, width: 2)),
              child: Center(
                child: Text(
                  "${dogMap["status"]}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
                ),
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            GestureDetector(
              onTap: () {
                getAllDogsMap();
                setState(() {});
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.deepOrangeAccent, border: Border.all(color: Colors.black, width: 2)),
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}