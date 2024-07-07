import 'package:flutter/material.dart';

void main() {
  runApp(helo());
}

class helo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                color: Colors.amber,
              ),
              Container(
                margin: EdgeInsets.all(50),
                color: Colors.purple,
              )
            ],
          ),
        ),
      ),
    );
  }
}
