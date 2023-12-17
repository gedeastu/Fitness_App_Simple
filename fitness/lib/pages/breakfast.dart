import 'package:flutter/material.dart';

class Breakfast extends StatefulWidget {
  const Breakfast({super.key});

  @override
  State<Breakfast> createState() => _BreakfastState();
}

class _BreakfastState extends State<Breakfast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Breakfast",
          style: TextStyle(fontFamily: ""),
        ),
        centerTitle: true,
      ),
      body: Container(

      ),
    );
  }
}