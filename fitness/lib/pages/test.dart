import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text Gradient Example'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: 5, // Set the number of buttons
            itemBuilder: (context, index) {
              return GradientTextButton(index: index);
            },
          ),
        ),
      ),
    );
  }
}

class GradientTextButton extends StatefulWidget {
  final int index;
  
  GradientTextButton({required this.index});

  @override
  _GradientTextButtonState createState() => _GradientTextButtonState();
}

class _GradientTextButtonState extends State<GradientTextButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
        // Add your onTap logic here
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: isPressed
              ? LinearGradient(
                  colors: [Colors.blue, Colors.green], // Gradient colors when pressed
                )
              : null, // Null when not pressed
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          'Button ${widget.index}',
          style: TextStyle(
            color: isPressed ? Colors.white : Colors.black, // Text color based on pressed state
          ),
        ),
      ),
    );
  }
}
