import 'package:flutter/material.dart';

AppBar AppBarWidget() {
    return AppBar(
      
      leading: GestureDetector(
        child: Container(
          height: 100,
          width: 100,
          margin: const EdgeInsets.all(7.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),color: Color.fromARGB(20, 161, 161, 161)),
          child: IconButton(onPressed:(){}, icon: const Icon(Icons.arrow_back),color: Colors.black, alignment: Alignment.center,),
        ),
      ),
      title: const Text(
        "Breakfast",
        style: TextStyle(fontFamily: "Plus Jakarta Sans",fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () {
            
          },
          child: Container(
          margin: const EdgeInsets.all(7.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),color: const Color.fromARGB(20, 161, 161, 161)),
          child: IconButton(onPressed:(){}, icon: const Icon(Icons.menu),color: Colors.black, alignment: Alignment.center,),
                  ),
        ),
      ],
    );
  }