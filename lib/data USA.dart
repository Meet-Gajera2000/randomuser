import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Dateusa extends StatefulWidget {
  const Dateusa({super.key});

  @override
  State<Dateusa> createState() => _DateusaState();
}

class _DateusaState extends State<Dateusa> {
  List dataUsaList = [];

  getDataUsaMap() async {
    try {
      var res = await http
          .get(Uri.parse("https://datausa.io/api/data?drilldowns=Nation&measures=Population"));
      var data = jsonDecode(res.body);
      dataUsaList = data["data"];
      debugPrint("$dataUsaList");
      setState(() {});
    } catch (e) {
      debugPrint("Error = $e");
    }
  }

  @override
  void initState() {
    getDataUsaMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Data Usa",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          GridView.builder(
            physics: const ScrollPhysics(),
            itemCount: dataUsaList.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (ctx, i) {
              return Column(
                children: [
                  const Text(
                    "Data USA",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "ID Nation: ${dataUsaList[i]["ID Nation"]}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Nation: ${dataUsaList[i]["Nation"]}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "ID Year: ${dataUsaList[i]["ID Year"]}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "IYear: ${dataUsaList[i]["Year"]}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Population: ${dataUsaList[i]["Population"]}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Slug Nation: ${dataUsaList[i]["Slug Nation"]}",
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
