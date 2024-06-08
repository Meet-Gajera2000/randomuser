import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Cat extends StatefulWidget {
  const Cat({super.key});

  @override
  State<Cat> createState() => _CatState();
}

class _CatState extends State<Cat> {
  Map catFact = {};

  getAllCatFact() async {
    var res = await http.get(Uri.parse("https://catfact.ninja/fact"));
    debugPrint("https://catfact.ninja/fact");
    var data = jsonDecode(res.body);
    catFact = data;
    debugPrint("$catFact");
    setState(() {});
  }

  @override
  void initState() {
    getAllCatFact();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.orange, border: Border.all(color: Colors.green)),
            child: Column(
              children: [
                Column(
                  children: [
                    const Text(
                      "Facts",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    Text("${catFact["fact"]}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                  ],
                ),
                const SizedBox(height: 40),
                Column(
                  children: [
                    const Text("Length",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Text("${catFact["length"]}",
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              getAllCatFact();
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}
