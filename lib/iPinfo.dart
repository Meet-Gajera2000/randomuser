import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Ipinfo extends StatefulWidget {
  const Ipinfo({super.key});

  @override
  State<Ipinfo> createState() => _IpinfoState();
}

class _IpinfoState extends State<Ipinfo> {
  Map iPinfoList = {};

  getAllIPifyMap() async {
    try {
      var res = await http.get(Uri.parse("https://ipinfo.io/161.185.160.93/geo"));

      var data = jsonDecode(res.body);

      iPinfoList = data;
      debugPrint("=======> $iPinfoList");

      setState(() {});
    } catch (e) {
      debugPrint("Error = $e");
    }
  }

  @override
  void initState() {
    getAllIPifyMap();
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
                    "${iPinfoList["ip"]}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${iPinfoList["city"]}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${iPinfoList["region"]}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${iPinfoList["country"]}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${iPinfoList["loc"]}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${iPinfoList["org"]}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${iPinfoList["postal"]}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${iPinfoList["timezone"]}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${iPinfoList["readme"]}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}