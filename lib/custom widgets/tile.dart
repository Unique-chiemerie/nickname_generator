import 'package:flutter/material.dart';

class TilE extends StatelessWidget {
  final String tex;
  const TilE({super.key, required this.tex});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 50,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            Colors.pinkAccent,
            Colors.purple,
          ],
        ),
        boxShadow: const [
          BoxShadow(color: Colors.pink),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.person_2_rounded),
          const SizedBox(
            width: 40,
          ),
          Text(
            tex,
          ),
        ],
      ),
    );
  }
}
