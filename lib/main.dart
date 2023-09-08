import 'dart:math';
import 'package:nickname_generator/custom%20widgets/tile.dart';

import 'nicknames.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<String> finalnames = [];
//this is the function that does the magic

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: ListView.builder(
              itemCount: finalnames.length,
              itemBuilder: (context, index) {
                return TilE(
                  tex: finalnames[index],
                );
              },
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              setState(() {
                finalnames.add(
                  adjectives[Random().nextInt(34)] +
                      mainname[Random().nextInt(30)],
                );
              });
            },
            child: const Text('Generate'),
          ),
        ],
      ),
    );
  }
}
