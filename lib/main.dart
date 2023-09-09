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
  bool isloading = false;
  bool spun = false;
  final ScrollController scrcontroller = ScrollController();
  @override
  void initState() {
    super.initState();
    scrcontroller.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    void generator() {
      setState(() {
        isloading = true;
        finalnames.add(
          ' ${adjectives[Random().nextInt(34)]} ${mainname[Random().nextInt(30)]}',
        );
      });
//simulation of delay
      Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          isloading = false;
        });
      });
    }

    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            'NICK-GEN',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w100),
          ),
          const SizedBox(
            height: 70,
          ),
          SizedBox(
            height: 50,
            width: 50,
            child: IconButton(
              onPressed: () {
                setState(() {
                  finalnames.clear();
                  spun = !spun;
                });
              },
              icon: spun
                  ? const Icon(
                      Icons.refresh,
                      color: Colors.purple,
                      size: 50,
                    )
                  : const Icon(
                      Icons.refresh_rounded,
                      color: Colors.white,
                      size: 50,
                    ),
            ),
          ),
          SizedBox(
            height: 450,
            width: double.infinity,
            child: ListView.builder(
              controller: scrcontroller,
              itemCount: finalnames.length,
              itemBuilder: (context, index) {
                //function for button here

                if (isloading = false) {
                  return const SizedBox(
                    height: 50,
                    width: 50,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return TilE(
                    tex: finalnames[index],
                  );
                }
              },
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              generator();
              scrcontroller.animateTo(scrcontroller.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn);
            },
            child: const Text('Generate'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrcontroller.dispose();
  }
}
