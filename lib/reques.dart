import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ColorApi extends StatefulWidget {
  const ColorApi({super.key});

  @override
  State<ColorApi> createState() => _ColorApiState();
}

class _ColorApiState extends State<ColorApi> {
  List allColor = [];
  int isSelect = 0;

  getColor() async {
    try {
      var res = await http.get(Uri.parse("https://reqres.in/api/usersF?per_page=10"));
      allColor = (jsonDecode(res.body)["data"]);
      debugPrint("-p------$allColor");
      setState(() {});
    } catch (e) {
      debugPrint("----$e");
    }
  }

  @override
  void initState() {
    getColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child:

            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: allColor.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 200,
              ),
              itemBuilder: (ctx, i) {
                return Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Color(int.parse(allColor[i]["color"].toString().replaceAll("#","0xff"))),
                  ),
                  child: Center(
                    child: Text(
                      "${allColor[i]["name"]}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}