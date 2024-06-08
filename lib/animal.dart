import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class animal extends StatefulWidget {
  const animal({super.key});

  @override
  State<animal> createState() => _animalState();
}

class _animalState extends State<animal> {
  List changeList = [];
  List categoriesList = [];
  List animalList  = [];

  getAllChange() async {
    try {
      var res = await http.get(Uri.parse("https://api.publicapis.org/entries"));

      var data = jsonDecode(res.body);
      debugPrint("StatusCode= ${res.statusCode}");
      changeList.addAll(data["entries"]);

      for (var i = 0; i < changeList.length; i++) {
        if (categoriesList.contains(changeList[i]["Category"])) {
          print("-----> Value already ava");
        } else {
          print("---------> value added");
          categoriesList.add("${changeList[i]["Category"]}");
        }
      }

      for(int i = 0;i<changeList.length;i++){
        if((changeList[i]["Category"]) == "Anime"){
          animalList.add(changeList[i]);
        }
      }
      debugPrint('${animalList.length}');
      // print('=======> $categoiesList');

      setState(() {});
    } catch (e) {
      debugPrint("Error = $e");
    }
  }

  @override
  void initState() {
    getAllChange();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "APIs",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: animalList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, i) {
                return Column(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      color: Colors.deepOrangeAccent,
                      child: Center(
                        child: Text(
                          "${animalList[i]["API"]}",
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}