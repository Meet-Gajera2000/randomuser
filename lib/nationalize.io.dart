import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Nationalize extends StatefulWidget {
  const Nationalize({super.key});

  @override
  State<Nationalize> createState() => _NationalizeState();
}

class _NationalizeState extends State<Nationalize> {
  List nationalizeList = [];

  getNationalizeMap() async {
    try {
      var res = await http
          .get(Uri.parse("https://api.nationalize.io?name=nathaniel"));
      var data = jsonDecode(res.body);
      nationalizeList = data["country"];
      debugPrint("$nationalizeList");

      setState(() {});
    } catch (e) {
      debugPrint("Error = $e");
    }
  }

  @override
  void initState() {
    getNationalizeMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nationalize",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: nationalizeList.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (ctx, i) {
              return Column(
                children: [
                  const Text(
                    "Nationalize.io",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "country_id: ${nationalizeList[i]["country_id"]}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "probability: ${nationalizeList[i]["probability"]}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
