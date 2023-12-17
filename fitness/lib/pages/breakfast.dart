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
        leading: IconButton(onPressed:(){}, icon: Icon(Icons.arrow_back)),
        title: const Text(
          "Breakfast",
          style: TextStyle(fontFamily: "Plus Jakarta Sans",fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed:() {}, icon: Icon(Icons.menu))
        ],
      ),
      body: Container(

      ),
    );
  }
}