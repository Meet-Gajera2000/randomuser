import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RandomUser extends StatefulWidget {
  const RandomUser({super.key});

  @override
  State<RandomUser> createState() => _randomState();
}

class _randomState extends State<RandomUser> {
  List randomUserList = [];

  getAllRandomUser() async {
    try {
      var res =
          await http.get(Uri.parse("https://randomuser.me/api/?results=2"));
      debugPrint("https://randomuser.me/api/?results=2");
      var data = jsonDecode(res.body);
      debugPrint("StatusCode= ${res.statusCode}");
      randomUserList.addAll(data["results"]);
      debugPrint("--------meet------ $randomUserList");
      setState(() {});
    } catch (e) {
      debugPrint("Error = $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8),
                shrinkWrap: true,
                itemCount: randomUserList.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, i) {
                  return Column(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: Colors.orange,
                            border: Border.all(color: Colors.black, width: 1)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(imageUrl: "${randomUserList[i]["picture"]["large"]}",
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ],
                  );
                })
          ],
        ),


        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () async {
          await getAllRandomUser();
        },
          child: const Icon(Icons.add),
        ),
    );
  }
}
