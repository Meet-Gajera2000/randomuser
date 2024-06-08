import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Coin extends StatefulWidget {
  const Coin({super.key});

  @override
  State<Coin> createState() => _CoinState();
}

class _CoinState extends State<Coin> {
  Map coinDeskMap = {};

  getAllCoinMap() async {
    try {
      var res = await http.get(Uri.parse("https://api.coindesk.com/v1/bpi/currentprice.json"));
      debugPrint("https://api.coindesk.com/v1/bpi/currentprice.json");
      var data = jsonDecode(res.body);
      coinDeskMap = data;
      debugPrint("$coinDeskMap");

      setState(() {});
    } catch (e) {
      debugPrint("Error = $e");
    }
  }

  @override
  void initState() {
    getAllCoinMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Coin Desk",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
        ),
      ),

      body: Column(
        children: [
          Center(
            child: Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
                border: Border.all(width: 1, color: Colors.black),
              ),

              child: Column(
                children: [
                  Column(
                    children: [
                      const Text(
                        "Coin Desk",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "updated: ${coinDeskMap["time"]["updated"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "updateduk: ${coinDeskMap["time"]["updateduk"]}",
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
    );
  }
}