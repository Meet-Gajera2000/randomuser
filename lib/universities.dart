import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UniversitiesList extends StatefulWidget {
  const UniversitiesList({super.key});

  @override
  State<UniversitiesList> createState() => _UniversitiesListState();
}

class _UniversitiesListState extends State<UniversitiesList> {
  List UniversitiesLis = [];

  getAllUniversitiesList() async {
    try {
      var res = await http.get(Uri.parse(
          "http://universities.hipolabs.com/search?country=United+States&limit=20"));

      debugPrint(
          "http://universities.hipolabs.com/search?country=United+States&limit=20");

      var data = jsonDecode(res.body);

      UniversitiesLis = data;
      debugPrint("$UniversitiesLis");

      setState(() {});
    } catch (e) {
      debugPrint("Error = $e");
    }
  }

  @override
  void initState() {
    getAllUniversitiesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Universities",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: UniversitiesLis.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 350),
                itemBuilder: (ctx, i) {
                  return Center(
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black, width: 1),
                              gradient: LinearGradient(colors: [
                                Color(0xFF00c6ff),
                                Color(0xFF0072ff),
                              ])),
                          child: Text(
                            "${UniversitiesLis[i]["name"]}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black, width: 1),
                              gradient: LinearGradient(colors: [
                                Color(0xFF00c6ff),
                                Color(0xFF0072ff),
                              ])),
                          child: Center(
                            child: Text(
                              "${UniversitiesLis[i]["country"]}",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black, width: 1),
                              gradient: LinearGradient(colors: [
                                Color(0xFF00c6ff),
                                Color(0xFF0072ff),
                              ])),
                          child: Center(
                            child: Text(
                              "${UniversitiesLis[i]["state-province"]}",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black, width: 1),
                              gradient: LinearGradient(colors: [
                                Color(0xFF00c6ff),
                                Color(0xFF0072ff),
                              ])),
                          child: Center(
                            child: Text(
                              "${UniversitiesLis[i]["alpha_two_code"]}",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black, width: 1),
                              gradient: LinearGradient(colors: [
                                Color(0xFF00c6ff),
                                Color(0xFF0072ff),
                              ])),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: UniversitiesLis[i]["web_pages"].length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, index) {
                              return Center(
                                child: Text(
                                  "${UniversitiesLis[i]["web_pages"][index]}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black, width: 1),
                              gradient: LinearGradient(colors: [
                                Color(0xFF00c6ff),
                                Color(0xFF0072ff

                                ),
                              ])),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: UniversitiesLis[i]["domains"].length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, ind) {
                              return Center(
                                child: Text(
                                  "${UniversitiesLis[i]["domains"][ind]}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
